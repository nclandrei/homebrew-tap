class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  url "https://github.com/nclandrei/proctor/archive/fcfcb90b6eac9dd6511830b483006d8e384a4342.tar.gz"
  version "0.1.1+git.20260317.fcfcb90"
  sha256 "42654ba26e69b117cd52d12f18bb05610a8eb1d5b7890708c01085c018e1f108"

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
