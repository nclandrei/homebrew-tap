class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/magellan/releases/download/v0.1.3/magellan-aarch64-apple-darwin.tar.xz"
      sha256 "2486281a2a6bc2eb180b8b9765c9087f09ef67a3145cfb1623a437fea135a5c4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.1.3/magellan-x86_64-apple-darwin.tar.xz"
      sha256 "305399a9d3f9367c6858b68ff7f5f6eae246860c71ee7230c2154662a22171b0"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.1.3/magellan-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1a3b77b2212c029978a4500f6c50631f223b24d52897d60538e7a3d9be8adf91"
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
