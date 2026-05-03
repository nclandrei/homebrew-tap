class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/88c0f2613f959203f354b906880cc48ff0b24001.tar.gz"
  version "0.6.6+git.20260503.88c0f26"
  sha256 "e3371891e2e18ba457867e32aa422cbf5cf854f1e2c66211265bbb64f3cec093"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
