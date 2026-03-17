class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  url "https://github.com/nclandrei/proctor/archive/f443e631ed81b2df656d333e0731d891ad1f7edc.tar.gz"
  version "0.1.1+git.20260317.f443e63"
  sha256 "0dc082324217f0adc8924dec06109aead78fd3bf3bef0c116042422ec879dfc6"

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
