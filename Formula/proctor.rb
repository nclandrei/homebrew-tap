class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nclandrei/proctor/releases/download/v0.8.0/proctor-aarch64-apple-darwin.tar.gz"
    sha256 "204bb840b03f6df575faa572fd11679c5bda8adf637d24ffbfee8a325d539967"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.8.0/proctor-x86_64-apple-darwin.tar.gz"
    sha256 "eabbc3810360d377956cbd5230fd660d423f59035893121f3ec198acdb3ca85a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.8.0/proctor-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d658d0b4267724545794dc3258370ae6a13e976a4dcbbc687ccac7f8d790f6a6"
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
