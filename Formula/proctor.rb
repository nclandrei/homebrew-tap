class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nclandrei/proctor/releases/download/v0.5.1/proctor-aarch64-apple-darwin.tar.gz"
    sha256 "84343443f0f18b1fca1693c385eafbb8d5e618107ee213ab571e5c72e1927122"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.5.1/proctor-x86_64-apple-darwin.tar.gz"
    sha256 "ce4f5aab94591228c8d1dc66dcdf40978f1debed5d90ec717d2558650b5034e1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.5.1/proctor-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4a762fac1bb9f31addfcb687a0509984e7ff3d4879e6d2911eeb185181e2ef6e"
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
