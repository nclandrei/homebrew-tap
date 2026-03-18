class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/b2c55ad706fc248aa4f85e0daec6517d4eaeac06.tar.gz"
  version "0.5.3+git.20260318.b2c55ad"
  sha256 "95590f6de96a62567d8f0abbeaf50d1d8e1459431fcd6bc72cd26f295e814d55"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
