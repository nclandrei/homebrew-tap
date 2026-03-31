class Planwarden < Formula
  desc "CLI planning enforcer for AI agents"
  homepage "https://github.com/nclandrei/planwarden"
  url "https://github.com/nclandrei/planwarden/archive/b00c1fff399fc99e9c98a4155ddd7b7acc5a6314.tar.gz"
  version "0.4.0+git.20260331.b00c1ff"
  sha256 "19c65df966863b4ff33b0de2d237ee0a4c06423d39fadf60292db688d4ebff21"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "planwarden", shell_output("#{bin}/planwarden --help")
  end
end
