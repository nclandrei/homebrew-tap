class Planwarden < Formula
  desc "CLI planning enforcer for AI agents"
  homepage "https://github.com/nclandrei/planwarden"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/planwarden/releases/download/v0.2.0/planwarden-aarch64-apple-darwin.tar.xz"
      sha256 "5d68772813279ea543cf695a7d9046592ec51152f2a1432fd5d0cac8b8da68af"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/planwarden/releases/download/v0.2.0/planwarden-x86_64-apple-darwin.tar.xz"
      sha256 "931c9cce67e603fa3d78c847abd2c125c827132df3d403b41f2439ef0de020ee"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/planwarden/releases/download/v0.2.0/planwarden-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ddcbf55b6a438a270e9c731d5741281191688214823d73ee88e909b854de6ebc"
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
