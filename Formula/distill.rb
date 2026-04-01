class Distill < Formula
  desc "CLI tool that monitors AI agent sessions, identifies patterns, and proposes skills"
  homepage "https://github.com/nclandrei/distill"
  version "0.6.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/distill/releases/download/v0.6.1/distill-cli-aarch64-apple-darwin.tar.xz"
      sha256 "0fa02ddbe2755d8852b82c753def13bb0c5785dde09835901b393fc06790ffe9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/distill/releases/download/v0.6.1/distill-cli-x86_64-apple-darwin.tar.xz"
      sha256 "fc6b1d2a3ef8e0f01011ebf3895ebdd2373811e2b30649d0739f7d097472a5f9"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/distill/releases/download/v0.6.1/distill-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "eacc04324abdd7eb342fafb2d11c43f3180da54efac0c6f1d85e70443304d9f3"
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
