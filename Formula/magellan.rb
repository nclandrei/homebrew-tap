class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  url "https://github.com/nclandrei/magellan/archive/fa31a9caf941230dd403a5e5626196956e86152e.tar.gz"
  version "0.7.1+git.20260425.fa31a9c"
  sha256 "c0ea26e1de6743b711ab3758eafaf2374a2e3fc435fd02820edeb0681361c76b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "magellan", shell_output("#{bin}/magellan --help")
  end
end
