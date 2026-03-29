class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  url "https://github.com/nclandrei/proctor/archive/cc791e5500cc43bf0fbe63054508a1114dd3c4fb.tar.gz"
  version "0.6.0+git.20260329.cc791e5"
  sha256 "fd336b4e567d632b68f787c48de674b893e6adaabbb50f27bd30e664883bcee5"

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
