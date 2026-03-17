class Screenforge < Formula
  desc "CLI tool for generating App Store-style marketing screenshots"
  homepage "https://github.com/nclandrei/screenforge"
  url "https://github.com/nclandrei/screenforge/archive/8fc16ff8a3f6106b34cac46fd36e609a1fded15b.tar.gz"
  version "0.1.5+git.20260305.8fc16ff"
  sha256 "d696c4604f1938e3863430516b40891aa0180ecef32a8ba34ef9addf1e63f10d"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "screenforge", shell_output("#{bin}/screenforge --help")
  end
end
