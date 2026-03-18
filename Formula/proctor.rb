class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  url "https://github.com/nclandrei/proctor/archive/a9a509b7e3b2a49805e0bb4b4a244dc7982d30fc.tar.gz"
  version "0.3.0+git.20260318.a9a509b"
  sha256 "5c07e05a79cad6393713d560d5a8430286ca38b99490663481f07033e09eccd5"

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
