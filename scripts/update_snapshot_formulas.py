#!/usr/bin/env python3

from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import json
import os
import re
import sys
import urllib.parse
import urllib.request
from dataclasses import dataclass
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parent.parent
MANIFEST_PATH = ROOT / "scripts" / "snapshot_formulas.json"
FORMULA_DIR = ROOT / "Formula"
GITHUB_API = "https://api.github.com"
SEMVER_TAG_RE = re.compile(r"^v?(\d+)\.(\d+)\.(\d+)$")


@dataclass
class Snapshot:
    formula: str
    version: str
    sha: str
    sha256: str
    commit_date: dt.datetime
    recent: bool


def build_headers() -> dict[str, str]:
    headers = {
        "Accept": "application/vnd.github+json",
        "User-Agent": "homebrew-tap-snapshot-updater",
    }
    token = os.getenv("GITHUB_TOKEN") or os.getenv("GH_TOKEN")
    if token:
        headers["Authorization"] = f"Bearer {token}"
    return headers


def github_json(path: str) -> Any:
    url = path if path.startswith("http") else f"{GITHUB_API}{path}"
    request = urllib.request.Request(url, headers=build_headers())
    with urllib.request.urlopen(request) as response:
        return json.load(response)


def github_paginated(path: str) -> list[Any]:
    url = path if path.startswith("http") else f"{GITHUB_API}{path}"
    items: list[Any] = []

    while url:
        request = urllib.request.Request(url, headers=build_headers())
        with urllib.request.urlopen(request) as response:
            items.extend(json.load(response))
            url = next_page_url(response.headers.get("Link"))

    return items


def next_page_url(link_header: str | None) -> str | None:
    if not link_header:
        return None

    for part in link_header.split(","):
        candidate, _, rel = part.partition(";")
        if 'rel="next"' not in rel:
            continue
        return candidate.strip()[1:-1]

    return None


def load_manifest() -> list[dict[str, Any]]:
    return json.loads(MANIFEST_PATH.read_text())


def parse_commit_datetime(value: str) -> dt.datetime:
    return dt.datetime.fromisoformat(value.replace("Z", "+00:00"))


def fetch_head_commit(repo: str, branch: str) -> tuple[str, dt.datetime]:
    query = urllib.parse.urlencode({"sha": branch, "per_page": 1})
    payload = github_json(f"/repos/{repo}/commits?{query}")
    if not payload:
        raise RuntimeError(f"{repo} returned no commits for branch {branch}")
    payload = payload[0]
    sha = payload["sha"]
    commit_date = parse_commit_datetime(payload["commit"]["committer"]["date"])
    return sha, commit_date


def latest_semver_version(repo: str) -> str:
    tags = github_paginated(f"/repos/{repo}/tags?per_page=100")
    versions: list[tuple[tuple[int, int, int], str]] = []

    for tag in tags:
        name = tag["name"]
        match = SEMVER_TAG_RE.match(name)
        if not match:
            continue
        versions.append(((int(match[1]), int(match[2]), int(match[3])), name.lstrip("v")))

    if not versions:
        raise RuntimeError(f"{repo} has no semver tags to anchor snapshot versions")

    versions.sort(key=lambda item: item[0])
    return versions[-1][1]


def tarball_url(repo: str, sha: str) -> str:
    return f"https://github.com/{repo}/archive/{sha}.tar.gz"


def sha256_for_url(url: str) -> str:
    request = urllib.request.Request(
        url,
        headers={"User-Agent": "homebrew-tap-snapshot-updater"},
    )
    digest = hashlib.sha256()

    with urllib.request.urlopen(request) as response:
        while True:
            chunk = response.read(1024 * 1024)
            if not chunk:
                break
            digest.update(chunk)

    return digest.hexdigest()


def formula_class(formula: str) -> str:
    return "".join(part.capitalize() for part in re.split(r"[-_]", formula))


def ruby_string(value: str) -> str:
    return value.replace("\\", "\\\\").replace('"', '\\"')


def snapshot_version(base_version: str, commit_date: dt.datetime, sha: str) -> str:
    return f"{base_version}+git.{commit_date:%Y%m%d}.{sha[:7]}"


def render_formula(entry: dict[str, Any], snapshot: Snapshot) -> str:
    repo = entry["repo"]
    build = entry["build"]
    lines = [
        f"class {formula_class(entry['formula'])} < Formula",
        f'  desc "{ruby_string(entry["desc"])}"',
        f'  homepage "https://github.com/{repo}"',
        f'  url "{tarball_url(repo, snapshot.sha)}"',
        f'  version "{snapshot.version}"',
        f'  sha256 "{snapshot.sha256}"',
    ]

    if entry.get("license"):
        lines.append(f'  license "{entry["license"]}"')

    lines.append("")

    if build["type"] == "cargo":
        lines.extend(
            [
                '  depends_on "rust" => :build',
                "",
                "  def install",
                '    system "cargo", "install", *std_cargo_args',
                "  end",
            ]
        )
    elif build["type"] == "go":
        lines.extend(
            [
                '  depends_on "go" => :build',
                "",
                "  def install",
                f'    system "go", "build", *std_go_args(ldflags: "-s -w"), "{build["target"]}"',
                "  end",
            ]
        )
    else:
        raise RuntimeError(f"Unsupported build type for {entry['formula']}: {build['type']}")

    lines.extend(["", "  test do"])
    for test_line in entry["test"]:
        lines.append(f"    {test_line}")
    lines.extend(["  end", "end", ""])

    return "\n".join(lines)


def describe_age(commit_date: dt.datetime, now: dt.datetime) -> str:
    age = now - commit_date
    return f"{age.total_seconds() / 3600:.1f}h old"


def build_summary(results: list[dict[str, str]]) -> str:
    lines = [
        "# Snapshot Formula Refresh",
        "",
        "| Formula | Status | Version | Commit | Note |",
        "| --- | --- | --- | --- | --- |",
    ]

    for result in results:
        lines.append(
            f"| {result['formula']} | {result['status']} | {result['version']} | "
            f"`{result['sha'][:7]}` | {result['note']} |"
        )

    lines.append("")
    return "\n".join(lines)


def refresh_formula(
    entry: dict[str, Any],
    now: dt.datetime,
    update_all: bool,
    window_hours: float,
) -> dict[str, str]:
    formula = entry["formula"]

    if entry.get("snapshot") is False:
        return {
            "formula": formula,
            "status": "disabled",
            "version": "-",
            "sha": "-",
            "note": entry.get("note", "snapshot updates disabled"),
        }

    sha, commit_date = fetch_head_commit(entry["repo"], entry["branch"])
    recent = (now - commit_date) <= dt.timedelta(hours=window_hours)

    if not update_all and not recent:
        return {
            "formula": formula,
            "status": "skipped",
            "version": "-",
            "sha": sha,
            "note": f"HEAD is {describe_age(commit_date, now)}",
        }

    base_version = latest_semver_version(entry["repo"])
    version = snapshot_version(base_version, commit_date, sha)
    formula_path = FORMULA_DIR / f"{formula}.rb"
    snapshot = Snapshot(
        formula=formula,
        version=version,
        sha=sha,
        sha256=sha256_for_url(tarball_url(entry["repo"], sha)),
        commit_date=commit_date,
        recent=recent,
    )
    content = render_formula(entry, snapshot)
    current = formula_path.read_text() if formula_path.exists() else ""

    if current == content:
        return {
            "formula": formula,
            "status": "unchanged",
            "version": version,
            "sha": sha,
            "note": "already at upstream HEAD",
        }

    formula_path.write_text(content)
    return {
        "formula": formula,
        "status": "updated",
        "version": version,
        "sha": sha,
        "note": "formula refreshed from upstream HEAD",
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--all",
        action="store_true",
        help="Refresh every formula regardless of upstream commit age.",
    )
    parser.add_argument(
        "--window-hours",
        type=float,
        default=24.0,
        help="Only refresh formulas whose upstream HEAD commit is newer than this many hours.",
    )
    parser.add_argument(
        "--summary-path",
        type=Path,
        help="Optional path for a markdown summary of the run.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    now = dt.datetime.now(dt.timezone.utc)
    manifest = load_manifest()
    results: list[dict[str, str]] = []

    for entry in manifest:
        result = refresh_formula(
            entry=entry,
            now=now,
            update_all=args.all,
            window_hours=args.window_hours,
        )
        results.append(result)
        print(
            f"{result['formula']}: {result['status']} "
            f"({result['version']}, {result['sha'][:7]}) - {result['note']}"
        )

    if args.summary_path:
        args.summary_path.write_text(build_summary(results))

    updated = sum(1 for result in results if result["status"] == "updated")
    print(f"Updated {updated} formula(s).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
