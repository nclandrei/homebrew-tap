class Planwarden < Formula
  desc "CLI planning enforcer for AI agents"
  homepage "https://github.com/nclandrei/planwarden"
  url "https://github.com/nclandrei/planwarden/archive/c69a9ea358dbbcc23c963d9c314d84a0144bb357.tar.gz"
  version "0.4.0+git.20260318.c69a9ea"
  sha256 "ccb98ecaa7ffb67cb31b091bf6d2bd2ca3e1d77d7cde66695eb1aa5a0fc72543"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "planwarden", shell_output("#{bin}/planwarden --help")
  end
end
