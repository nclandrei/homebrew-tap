class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  version "0.5.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/magellan/releases/download/v0.5.0/magellan-aarch64-apple-darwin.tar.xz"
      sha256 "79f6c40c109efc55d5df651a1dab404a85775cdc94c709b0bdaea8893619e225"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.5.0/magellan-x86_64-apple-darwin.tar.xz"
      sha256 "0f5e4812f45fdf3b129189fd848944b66d5f13d0f826a65cd38621e8bddd6eaf"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/magellan/releases/download/v0.5.0/magellan-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c972ae2fc91f5f44c7504f8af68248a792e7ba9d7f5548555d8e1d8acf3278ac"
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
