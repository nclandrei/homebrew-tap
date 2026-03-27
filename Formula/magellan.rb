class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  url "https://github.com/nclandrei/magellan/archive/8dde0c88b5f2579bc9e6ff8cf694c658b42ebdc3.tar.gz"
  version "0.2.0+git.20260327.8dde0c8"
  sha256 "1e637c18547ef6b6d15578632ab69011330c170b474656ef93a87d44c8b37a08"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "magellan", shell_output("#{bin}/magellan --help")
  end
end
