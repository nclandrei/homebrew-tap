class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  version "0.5.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/magellan/releases/download/v0.5.1/magellan-aarch64-apple-darwin.tar.xz"
      sha256 "6a8c0c2a5b22086c808fbea37aa314333543e885c4f1206bbfdb2a12276c12e6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.5.1/magellan-x86_64-apple-darwin.tar.xz"
      sha256 "de40d6e8e4012b91e08ae2d9558ee326c1ee043bf50c611a2158195f23974cf8"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.5.1/magellan-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "91880689018a49ba5ddaaf397fee2c7e211e52e5cb79e580b7151fa6bfa5c74f"
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
