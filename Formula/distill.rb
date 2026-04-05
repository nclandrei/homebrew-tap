class Distill < Formula
  desc "CLI tool that monitors AI agent sessions, identifies patterns, and proposes skills"
  homepage "https://github.com/nclandrei/distill"
  version "0.6.5"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/distill/releases/download/v0.6.5/distill-cli-aarch64-apple-darwin.tar.xz"
      sha256 "7307b4dff8db090257db91ea0ac4d70d59200985b8d973c33bc54cc66fea74d0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/distill/releases/download/v0.6.5/distill-cli-x86_64-apple-darwin.tar.xz"
      sha256 "73e1222ada16c20d8b55bd5e62aea9f1a6f13ceb65bec01c57f07a229d091f3f"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/distill/releases/download/v0.6.5/distill-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "243f9f67ed09f0b876645046920b101aaa5bceb3fc7d49cc267236845ef334b5"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "x86_64-apple-darwin": {},
    "x86_64-unknown-linux-gnu": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "distill"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "distill"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "distill"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
