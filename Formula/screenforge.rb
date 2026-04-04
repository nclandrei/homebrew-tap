class Screenforge < Formula
  desc "CLI tool for generating App Store-style marketing screenshots"
  homepage "https://github.com/nclandrei/screenforge"
  url "https://github.com/nclandrei/screenforge/archive/29efa331ee49f98aae2f6a62b6d9ec793a61f575.tar.gz"
  version "0.1.5+git.20260404.29efa33"
  sha256 "7dfc40a46472631fffa343e3a530ce0e3f704ae6eac325830150af5151eaef0c"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "screenforge", shell_output("#{bin}/screenforge --help")
  end
end
