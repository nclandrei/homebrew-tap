class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  version "0.7.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/magellan/releases/download/v0.7.0/magellan-aarch64-apple-darwin.tar.xz"
      sha256 "3c68638a45839c654bf162e70e6ad12b637608cce45103039e80479c918de9b9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.7.0/magellan-x86_64-apple-darwin.tar.xz"
      sha256 "2824245af710e19ea933b8e43ba8454077d9078908c66dccc04b6df760d101ef"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.7.0/magellan-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "44c35da3d059c8bdd311a2b5d108dc3e6eb93c93ffd55d4be061091eff82ef6f"
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
