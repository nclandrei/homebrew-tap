class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  version "0.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/magellan/releases/download/v0.4.0/magellan-aarch64-apple-darwin.tar.xz"
      sha256 "a6384c1a35a1c2071172e60d777a646889fc2f53e85abfe99a798edb1b9c32c7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.4.0/magellan-x86_64-apple-darwin.tar.xz"
      sha256 "3bc366f1c5d20fc5c62302d21466d04dc211d129fea5b3a5321de0b6d4535e10"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.4.0/magellan-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "14d92a631c9d77d75ba749ad00c1c1c5325fc43c06b288728f4e05e76788aa3f"
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
