class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/b28148e4e8519e82b0f74ee5970bf39a90ff7fd2.tar.gz"
  version "0.5.2+git.20260317.b28148e"
  sha256 "6ef1700721c9a6fd564e73ba4f12db5ee1301fa86d2d9ebbd2807f7a2725d942"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
