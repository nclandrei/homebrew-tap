class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  url "https://github.com/nclandrei/magellan/archive/34145116c2596727db7898278bd98c9df49eb8ef.tar.gz"
  version "0.4.0+git.20260404.3414511"
  sha256 "690227c9cb4f3a34f04b58d015d316a3385bd86e9976a1bf419529dd8bd21ffa"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "magellan", shell_output("#{bin}/magellan --help")
  end
end
