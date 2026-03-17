class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  url "https://github.com/nclandrei/magellan/archive/9bc818bc1f47caa557d4fb50d51ffa6466bac79d.tar.gz"
  version "0.1.3+git.20260317.9bc818b"
  sha256 "53f738efe63c6ae8fe27c1ac690b6435e2739e3e5eb7e607f99adc59803389f0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "magellan", shell_output("#{bin}/magellan --help")
  end
end
