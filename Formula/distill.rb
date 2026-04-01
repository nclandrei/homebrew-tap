class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/686a40aaa8eb74e5ad6e6e5c9b0f528f871fb697.tar.gz"
  version "0.6.2+git.20260401.686a40a"
  sha256 "6f876e805b2f8795e1e6bf13c22d1366566e722a0bb927887521bf06834ed779"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
