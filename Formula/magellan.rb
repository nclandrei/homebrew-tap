class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  url "https://github.com/nclandrei/magellan/archive/696a76dd681f3d2cde8607d3ac8bd3569e2e4922.tar.gz"
  version "0.4.0+git.20260401.696a76d"
  sha256 "fdaf4e8af061b8ded07378f3c76159794f1ffe31399bd3eef725c5edd7b24336"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "magellan", shell_output("#{bin}/magellan --help")
  end
end
