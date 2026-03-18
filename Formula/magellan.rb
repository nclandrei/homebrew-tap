class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  version "0.1.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/magellan/releases/download/v0.1.4/magellan-aarch64-apple-darwin.tar.xz"
      sha256 "86614aaf07b65ada01ffa4387c7790aea6197e953b8b993350c5a3997a7b6cc0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.1.4/magellan-x86_64-apple-darwin.tar.xz"
      sha256 "bbc5f9056315801984d90824349264cc826d688d96ea28ea69379265ea1c9f32"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.1.4/magellan-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "75ab968a2c80836a5551b5ef449d44c6f522ab6ef619b42d778cb4842692fd61"
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
