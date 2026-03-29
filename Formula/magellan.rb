class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/magellan/releases/download/v0.3.0/magellan-aarch64-apple-darwin.tar.xz"
      sha256 "7c1f8ea9777fadea68367e0cb29a9bda4c99b168d53766b21d3e92b611652697"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.3.0/magellan-x86_64-apple-darwin.tar.xz"
      sha256 "c502543554248b59df9ba80daeb556f7a75359ea6ab3b6bd4e64011316dc6a43"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.3.0/magellan-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "555cbe0563a0b7eda7d0528db12ddf5f917f4085abd59bc054bd6b2200ee405f"
    end
  end
  license "MIT"

  def install
    bin.install "magellan"

    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files - ["magellan"]
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end

  test do
    assert_match "magellan", shell_output("#{bin}/magellan --help")
  end
end
