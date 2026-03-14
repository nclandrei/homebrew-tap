class Planwarden < Formula
  desc "CLI planning enforcer for AI agents"
  homepage "https://github.com/nclandrei/planwarden"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/planwarden/releases/download/v0.1.0/planwarden-aarch64-apple-darwin.tar.xz"
      sha256 "f454f4f263dca7dcb5e4fcd6754b45616496741e52cb6f56455fe56a2769e93d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/planwarden/releases/download/v0.1.0/planwarden-x86_64-apple-darwin.tar.xz"
      sha256 "ca68bcabdc01e2b4ec592d2ca418681230e73d7b949ca63afa40b46ad237a96b"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/planwarden/releases/download/v0.1.0/planwarden-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "36088ab39c6b572f9011f3c1f4b12a203895a118aefe373649857a86efb00ca8"
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
