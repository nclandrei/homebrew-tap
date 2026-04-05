class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nclandrei/proctor/releases/download/v0.7.0/proctor-aarch64-apple-darwin.tar.gz"
    sha256 "6a3683b87e7b3fbc3c8b96fe8788c50552070014a211fa3b25b7b093e8559006"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.7.0/proctor-x86_64-apple-darwin.tar.gz"
    sha256 "b4b505aef7d2893c8e48394add54d1516516a4df58fb2b3f588f57d9a871b2ab"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.7.0/proctor-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2eda20c248184100b453c3bc62e0f1fbfeee877a0cca9053bac59f6d1c096994"
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
