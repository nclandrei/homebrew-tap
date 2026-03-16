class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  version "0.1.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/proctor/releases/download/v0.1.1/proctor-aarch64-apple-darwin.tar.gz"
      sha256 "bbf14c837328b2345b8451862a28f38271ef50ca5d8e68c144ce28a0e789b5a3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/proctor/releases/download/v0.1.1/proctor-x86_64-apple-darwin.tar.gz"
      sha256 "692cc5f961a4fcd823c89016251e67285e1d08234c1e6c466e0ac02617453c81"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/proctor/releases/download/v0.1.1/proctor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a71d080835e4216a614686881db3e7bb69011746f51941cee2a0713a8125aed"
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
