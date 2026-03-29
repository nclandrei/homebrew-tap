class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  url "https://github.com/nclandrei/magellan/archive/5cb0cab4a78d8a6d1ede0d2a899833f41ed37de3.tar.gz"
  version "0.3.0+git.20260329.5cb0cab"
  sha256 "288656cb85dab8df49ae3c54566cfcb92953ad38d240da32987b3db51121481d"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "magellan", shell_output("#{bin}/magellan --help")
  end
end
