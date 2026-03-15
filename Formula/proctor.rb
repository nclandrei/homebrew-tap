class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/homebrew-tap/releases/download/proctor-v0.1.0/proctor-aarch64-apple-darwin.tar.gz"
      sha256 "f111bfaba251ecddf5884b732f9cd901d44d3cf1b224efde55fb4e562657eba4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/homebrew-tap/releases/download/proctor-v0.1.0/proctor-x86_64-apple-darwin.tar.gz"
      sha256 "0932b97b05613656dc61ac02b0bdb1d4fe11c21985dddd896f398e221c40eee7"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/homebrew-tap/releases/download/proctor-v0.1.0/proctor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c2c1d2cddb16a8677a6c89a26a92fc614345b59b2e01f0bc232f35755531851"
    end
  end

  def install
    bin.install "proctor"
  end

  test do
    output = shell_output("#{bin}/proctor --help")
    assert_match "make a coding agent prove it manually tested its own work", output
    assert_match "Codex, Claude Code", output
  end
end
