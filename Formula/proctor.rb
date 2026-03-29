class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nclandrei/proctor/releases/download/v0.6.0/proctor-aarch64-apple-darwin.tar.gz"
    sha256 "bb810df5842411a4e4e8126b260b181dd805a1ca53930a4d7174ced35d724f23"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.6.0/proctor-x86_64-apple-darwin.tar.gz"
    sha256 "ca996a29edcff82351fc2dde0a1d49aeddafecef5dbaf0013407eda923205a72"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.6.0/proctor-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7b59198c6c48685dde1220e4cbfc7671368100e51849aa99aa3689ee20d20ff5"
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
