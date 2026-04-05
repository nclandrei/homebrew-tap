class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/31c6f6003ab41927e030de2de97a864528cfa9f1.tar.gz"
  version "0.6.5+git.20260405.31c6f60"
  sha256 "a6fd41b42e48e19b87a1075d43c5b57a0de875b5cb2afe0b2b43e286cb56fc68"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
