class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nclandrei/proctor/releases/download/v0.11.0/proctor-aarch64-apple-darwin.tar.gz"
    sha256 "55e843fa654fe8b3ada1e737c5b9efa033de732b44cf91c6eefb303e49b8f1a2"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.11.0/proctor-x86_64-apple-darwin.tar.gz"
    sha256 "e5f4fd6fe1a53aa9f208e911dedee3edd1ee5ec4292ad2a1bcee86e35b00a52c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.11.0/proctor-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b010bc5d12ae1dbe83c56a05a6a4593c4a37f4d6ca320597f0b83e5fc30a3061"
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
