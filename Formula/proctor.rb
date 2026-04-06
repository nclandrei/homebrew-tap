class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  url "https://github.com/nclandrei/proctor/archive/6f5deb00c65e563030835f8c727a5b924b6428a0.tar.gz"
  version "0.8.0+git.20260406.6f5deb0"
  sha256 "1148346726ac48a4da28ee29252896e4445b24ea50b7abbea1a148083bb5f384"

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
