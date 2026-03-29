class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nclandrei/proctor/releases/download/v0.5.0/proctor-aarch64-apple-darwin.tar.gz"
    sha256 "b57ee63453103228f22f5a598be00e0d87bbaf8cf30bb7672aad3085c67936ab"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.5.0/proctor-x86_64-apple-darwin.tar.gz"
    sha256 "9c4ea41e62761b3b4e4606b49c06c9f5e65a92534d8c920be23c22b6cfc30b17"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.5.0/proctor-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cde911231ecb98564f84104e8e9af85586dda01a3e6521cac63a071e362c135b"
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
