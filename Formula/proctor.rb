class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nclandrei/proctor/releases/download/v0.4.0/proctor-aarch64-apple-darwin.tar.gz"
    sha256 "0f552e28101deb379cc18fa97bc46a77717884581b1c6037d47a76cfda399dad"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.4.0/proctor-x86_64-apple-darwin.tar.gz"
    sha256 "e002be329b81fbc95c180679b41e00eab75a5352996b6bcee049c1df1e093ba1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.4.0/proctor-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2cad303bce242be7e55ad91077d791ff71770e20608102ac21f26339f3ca996b"
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
