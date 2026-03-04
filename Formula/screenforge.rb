class Screenforge < Formula
  desc "CLI tool for generating App Store-style marketing screenshots"
  homepage "https://github.com/nclandrei/screenforge"
  url "https://github.com/nclandrei/screenforge/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "558353fc387974b293db5aff99b5e58a03ec1234ec546c104012fe43809c5e6f"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "screenforge", shell_output("#{bin}/screenforge --help")
  end
end
