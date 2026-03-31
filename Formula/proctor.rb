class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  url "https://github.com/nclandrei/proctor/archive/62ce8b903212cf2eaa9d134463cf6e48e40ed083.tar.gz"
  version "0.6.0+git.20260331.62ce8b9"
  sha256 "aca4fe9164afb7729474175537c7916d34fd9c561190520e7ae1f3d309b7cb65"

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
