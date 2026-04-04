class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/172349bd780e46121735a7183aebc515a933e4f8.tar.gz"
  version "0.6.4+git.20260404.172349b"
  sha256 "1af41a1c7da58e3830e4006a27c22e40528233232a237460763e5b3616f334bb"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
