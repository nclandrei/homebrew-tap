class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/bd8f6482b37d70d407d81aeb8925f4b833d398a8.tar.gz"
  version "0.6.4+git.20260402.bd8f648"
  sha256 "e39c009aa7fd7d859a05d1f23832e23d032af965ca4160a0f0d284dfcd20d752"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
