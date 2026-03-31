class Screenforge < Formula
  desc "CLI tool for generating App Store-style marketing screenshots"
  homepage "https://github.com/nclandrei/screenforge"
  url "https://github.com/nclandrei/screenforge/archive/148212995c16ba5d1055eaaf3e1bf33cc13e9d0f.tar.gz"
  version "0.1.5+git.20260331.1482129"
  sha256 "423257847f27d71bdec060fd0b53b653570fd6a29dae491d914507d81198f41f"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "screenforge", shell_output("#{bin}/screenforge --help")
  end
end
