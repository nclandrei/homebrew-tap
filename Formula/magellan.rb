class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  url "https://github.com/nclandrei/magellan/archive/586acca84b396ebdb521f43dbc8d61f496a5ebab.tar.gz"
  version "0.1.4+git.20260318.586acca"
  sha256 "3bb5883226f4eac4406624a5d8beb5f17d8692aee7207c9be8e9329256a38fe6"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "magellan", shell_output("#{bin}/magellan --help")
  end
end
