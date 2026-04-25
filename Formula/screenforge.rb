class Screenforge < Formula
  desc "CLI tool for generating App Store-style marketing screenshots"
  homepage "https://github.com/nclandrei/screenforge"
  url "https://github.com/nclandrei/screenforge/archive/refs/tags/v0.1.6.tar.gz"
  version "0.1.6"
  sha256 "266fa7cde95a914a51e10db086add3d72efab2e119d292058ccd77bce648954d"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "screenforge", shell_output("#{bin}/screenforge --help")
  end
end
