class Planwarden < Formula
  desc "CLI planning enforcer for AI agents"
  homepage "https://github.com/nclandrei/planwarden"
  version "0.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/planwarden/releases/download/v0.4.0/planwarden-aarch64-apple-darwin.tar.xz"
      sha256 "00bc50eda767751cdb0aea699cf4977dda66ec680309320b8f556f01b7fcbadd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/planwarden/releases/download/v0.4.0/planwarden-x86_64-apple-darwin.tar.xz"
      sha256 "13f11c8c945900d550adb8334adb81b229036010b765b7108631261cf72273e1"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/planwarden/releases/download/v0.4.0/planwarden-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f42fb02288b5328bc32e0a167119a3dd3e8430dc77e9970d45d46f3c4be53097"
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
