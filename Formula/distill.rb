class Distill < Formula
  desc "CLI tool that monitors AI agent sessions, identifies patterns, and proposes skills"
  homepage "https://github.com/nclandrei/distill"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nclandrei/distill/releases/download/v0.1.1/distill-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "d6c40c3298dd853eea8c9217a0d001bb17e24bfe3617497fcc4edf152980273d"
    else
      url "https://github.com/nclandrei/distill/releases/download/v0.1.1/distill-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "e0f340a0865abbb6a284b463165e66b57abfbbf5580b1e7db669764d7b843fe5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/nclandrei/distill/releases/download/v0.1.1/distill-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30cc12732d631a259919b7f06fef3678e9df9f433669e942e2448bf11ef3fe04"
    end
  end

  def install
    bin.install "distill"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/distill --version")
  end
end
