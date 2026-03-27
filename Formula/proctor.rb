class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  url "https://github.com/nclandrei/proctor/archive/606c91300e72d08a330458341cf255062b7d378b.tar.gz"
  version "0.4.0+git.20260327.606c913"
  sha256 "f7cba235035242a064cebde459d87f39186ffc9b75a86ec90d9777dd348aebd0"

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
