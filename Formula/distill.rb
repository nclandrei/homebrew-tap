class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/8647d90e2bb108d4f8731c321da2dd9a7bc99315.tar.gz"
  version "0.6.6+git.20260504.8647d90"
  sha256 "5945561cdd353fe5bc60c1216bc51b3e18b147ba48ed06c76f49aad50951c2cf"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
