class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nclandrei/proctor/releases/download/v0.3.0/proctor-aarch64-apple-darwin.tar.gz"
    sha256 "1c790539e0f84706ad3cc16c9a59209361a3d51185057d23e01d67ba9f05d32e"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.3.0/proctor-x86_64-apple-darwin.tar.gz"
    sha256 "54357592fc998b8c9b58556c25b7217ed3a87b8054f7a24ae5159209f806f84e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.3.0/proctor-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "41852a88fda18e5bd2fe746fa5fababd42cd78de4bf71afadbd21bc6210793b2"
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
