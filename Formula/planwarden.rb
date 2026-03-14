class Planwarden < Formula
  desc "CLI planning enforcer for AI agents"
  homepage "https://github.com/nclandrei/planwarden"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/planwarden/releases/download/v0.3.0/planwarden-aarch64-apple-darwin.tar.xz"
      sha256 "75603ba8b7c704082eb01c7d002962aa76702b0eb6bd0dacc3f55c74f0b1b27c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/planwarden/releases/download/v0.3.0/planwarden-x86_64-apple-darwin.tar.xz"
      sha256 "0cf8efcfa4b5719a52d7579f9f39762213238fa4ed49c287c0a4c033490d325c"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/planwarden/releases/download/v0.3.0/planwarden-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "738532471721e0dc707a608ba901d6050b33e17416f357cc6416b51862993cfa"
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
      bin.install "planwarden"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "planwarden"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "planwarden"
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
