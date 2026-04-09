class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nclandrei/proctor/releases/download/v0.10.0/proctor-aarch64-apple-darwin.tar.gz"
    sha256 "9bb42efd7bf5576aeb9dc7ebf95022562a3c166ef19152881bd7ec2abdb40f6c"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.10.0/proctor-x86_64-apple-darwin.tar.gz"
    sha256 "4e015849a444ef301180c9c7c7648854baebcf3ca54b01721d6e0b175d270487"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.10.0/proctor-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "50f35cf53850c9fa65f56ccd47bc26454145265161e27ca8816bdf27e4f0a68b"
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
