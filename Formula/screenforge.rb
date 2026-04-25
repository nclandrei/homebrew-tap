class Screenforge < Formula
  desc "CLI tool for generating App Store-style marketing screenshots"
  homepage "https://github.com/nclandrei/screenforge"
  url "https://github.com/nclandrei/screenforge/archive/e3135037a9ff8b6ec82f4f906436a1182f847cde.tar.gz"
  version "0.1.6+git.20260425.e313503"
  sha256 "bd17a8fdee2b9529967dc14b520d67dd1018fa9320c66234e46587a399a44c7e"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "screenforge", shell_output("#{bin}/screenforge --help")
  end
end
