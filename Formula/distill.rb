class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/85c134314c5b33c76934fe82b99cbdb1ea920166.tar.gz"
  version "0.6.6+git.20260415.85c1343"
  sha256 "c4dc3fe47106ecad2ee57b5129f04b6240adcce34aa73fee93a5976056c446fe"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
