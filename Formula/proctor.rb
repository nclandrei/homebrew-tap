class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nclandrei/proctor/releases/download/v0.2.0/proctor-aarch64-apple-darwin.tar.gz"
    sha256 "1c3ba250bacf2d45ea778381af0b66cd801fc792480d2a633f22dc7f8bd028e3"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.2.0/proctor-x86_64-apple-darwin.tar.gz"
    sha256 "f05b7a7fbcd4d489bcd936fbd9e25b799b88fd60bc08b0c4f3276b7dc4ed6afb"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.2.0/proctor-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ac5df161f5cf920531006367f60758807a4e383791937ed7eceeb99c620c2beb"
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
