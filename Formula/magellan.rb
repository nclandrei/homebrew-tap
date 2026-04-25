class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  version "0.7.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/magellan/releases/download/v0.7.1/magellan-aarch64-apple-darwin.tar.xz"
      sha256 "a905c7d6d00853327b1944ee5a983a1a3a290dce45603e6b7e57747b92a1b070"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.7.1/magellan-x86_64-apple-darwin.tar.xz"
      sha256 "e4b5231d0c1b35eafec79862d474157a708fad1e96735f58e1015550a7ace5bc"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.7.1/magellan-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0f555d59eed7505049319ca6774f69bd2eb001cae2ca2a5d010488963098b4d9"
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
