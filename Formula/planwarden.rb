class Planwarden < Formula
  desc "CLI planning enforcer for AI agents"
  homepage "https://github.com/nclandrei/planwarden"
  url "https://github.com/nclandrei/planwarden/archive/0f638a9035e65ece8f227a726df3df38d9ab59ae.tar.gz"
  version "0.4.0+git.20260315.0f638a9"
  sha256 "5bfad5fcdafe4186063ab1aca4682f73209deaaa94c308aab3e40e472c3828be"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "planwarden", shell_output("#{bin}/planwarden --help")
  end
end
