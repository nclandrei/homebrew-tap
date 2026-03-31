class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  url "https://github.com/nclandrei/magellan/archive/c78048e1e57ccc00fff6a2ce4051b0977b6a443d.tar.gz"
  version "0.3.0+git.20260331.c78048e"
  sha256 "0af11beceff901ec74eba5b8fc9955d707195001505d9bd119c6312c3a7ecb8a"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "magellan", shell_output("#{bin}/magellan --help")
  end
end
