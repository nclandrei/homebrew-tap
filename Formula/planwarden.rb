class Planwarden < Formula
  desc "CLI planning enforcer for AI agents"
  homepage "https://github.com/nclandrei/planwarden"
  url "https://github.com/nclandrei/planwarden/archive/28da81a46fad6925559ab7fec745a5254f47d528.tar.gz"
  version "0.4.0+git.20260404.28da81a"
  sha256 "a642a603f025051277cae4497ca4edf55f3eb3d65aba58911df4a1146dec821b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "planwarden", shell_output("#{bin}/planwarden --help")
  end
end
