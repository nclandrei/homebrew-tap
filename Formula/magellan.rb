class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  version "0.6.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/magellan/releases/download/v0.6.0/magellan-aarch64-apple-darwin.tar.xz"
      sha256 "0f504b0fab1876dc1ab92004077242c7583558bd4a083f33af2364e7bbad26cf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.6.0/magellan-x86_64-apple-darwin.tar.xz"
      sha256 "1b93c96f7d6e1259b9ff8fb43769d9eede3fc8dddbbe3c9bc94a73b8af61d345"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.6.0/magellan-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "288523e3be612b8685e718f913c4e77dc97504d7a718dc57e0ddb65197f00977"
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
