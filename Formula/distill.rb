class Distill < Formula
  desc "CLI tool that monitors AI agent sessions, identifies patterns, and proposes skills"
  homepage "https://github.com/nclandrei/distill"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/distill/releases/download/v0.3.0/distill-cli-aarch64-apple-darwin.tar.xz"
      sha256 "51d05c413414e3be99b5e8a40573757cc70a64ca08daa0d38b94e2adfcdb825e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/distill/releases/download/v0.3.0/distill-cli-x86_64-apple-darwin.tar.xz"
      sha256 "e8663b71f64b97c947f8cd54f86b4a9985ea02a6c8672360b2ea7d32bbf27efa"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/distill/releases/download/v0.3.0/distill-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3642125628d1f2cbb41419c23b8630d645de0dc057db3383f807ccf63888fa98"
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
