class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/6df1c219930e64d965985fc3ab64be95ab0a39f0.tar.gz"
  version "0.6.6+git.20260425.6df1c21"
  sha256 "85d7cbb7f50812c6074a3b1d6c1e9e0429c5cffa3ad7f6bb00d1fa6af5b22a96"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
