class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/magellan/releases/download/v0.2.0/magellan-aarch64-apple-darwin.tar.xz"
      sha256 "8b1329f2318f279f68f2343051706d8c9eee780d9736ffb7a635705e138cdfce"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.2.0/magellan-x86_64-apple-darwin.tar.xz"
      sha256 "18e10e513f125e84a793b3998ac21a2fd8e52189eba05d1914b4c54ab5756079"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.2.0/magellan-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4492a8b6e2dacf93955d29ef3c4be23c0b61b62d5da8e83c516c1ca47e81a444"
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
