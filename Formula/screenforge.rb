class Screenforge < Formula
  desc "CLI tool for generating App Store-style marketing screenshots"
  homepage "https://github.com/nclandrei/screenforge"
  url "https://github.com/nclandrei/screenforge/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "2fa0a20dffb788710b518da924952a671c009b776dec4c443aae2fd42c568680"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "screenforge", shell_output("#{bin}/screenforge --help")
  end
end
