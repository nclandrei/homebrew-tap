class Distill < Formula
  desc "CLI tool that monitors AI agent sessions, identifies patterns, and proposes skills"
  homepage "https://github.com/nclandrei/distill"
  version "0.1.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/distill/releases/download/v0.1.4/distill-cli-aarch64-apple-darwin.tar.xz"
      sha256 "59937ef9b2c9df98f14f9cc9e52872d81d52ddadccd7ba5c3eecbde150d2ebd9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/distill/releases/download/v0.1.4/distill-cli-x86_64-apple-darwin.tar.xz"
      sha256 "2d35e630e3755a1814fb06962a9c70a9180602ba8481f09b0c3744a7b7cd2182"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/distill/releases/download/v0.1.4/distill-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6a00fa7899d2996d9565f57c8cd03910f52a5ba9dede8a85d7485d8f13713394"
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
