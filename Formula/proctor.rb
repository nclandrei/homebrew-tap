class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nclandrei/proctor/releases/download/v0.9.0/proctor-aarch64-apple-darwin.tar.gz"
    sha256 "300ceb8dbcad2aa98ad88217a9abd7a29011cd46a865ad80607fe0095b00bbe9"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.9.0/proctor-x86_64-apple-darwin.tar.gz"
    sha256 "8b08de938e1fa683dde6f70665a59254c66bedbcbeeb68fddaf0326fe081a466"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nclandrei/proctor/releases/download/v0.9.0/proctor-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "113a4610192ed9e1d366ef446c14c34cd1b204829a7ebae16082bd7e7062d726"
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
