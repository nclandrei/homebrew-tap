class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  url "https://github.com/nclandrei/proctor/archive/f89236f1337f736c6aeadd3ea6792aa5e18f7ed6.tar.gz"
  version "0.9.0+git.20260408.f89236f"
  sha256 "62ba52c6b9a77df735b641076a4ba41984f53c726171850f09962fa1827b778f"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    output = shell_output("#{bin}/proctor --help")
    assert_match "make a coding agent prove it manually tested its own work", output
    assert_match "Codex, Claude Code", output
  end
end
