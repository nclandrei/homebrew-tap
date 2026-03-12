class Distill < Formula
  desc "CLI tool that monitors AI agent sessions, identifies patterns, and proposes skills"
  homepage "https://github.com/nclandrei/distill"
  version "0.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/distill/releases/download/v0.4.0/distill-cli-aarch64-apple-darwin.tar.xz"
      sha256 "960b8ad7b5b2b875c922fcf5bac6dc98062c44f3e654616a1e313348f69c9683"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/distill/releases/download/v0.4.0/distill-cli-x86_64-apple-darwin.tar.xz"
      sha256 "077e74949663a35cf5c314a08a063ab845cdf74348afc18b7232a88b0346f946"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/distill/releases/download/v0.4.0/distill-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "899a103612e176a6e69bde1c87a0be7262b3cbb870d0e028f3a412f9e997c0ca"
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
