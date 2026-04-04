class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  url "https://github.com/nclandrei/proctor/archive/7687e959a9a6347b314f114a776efd1944e7e313.tar.gz"
  version "0.6.0+git.20260404.7687e95"
  sha256 "a523574723701d9e97c89e1842b3b3d6a24279c11f5c4bd4cd0959eda840a1e2"

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
