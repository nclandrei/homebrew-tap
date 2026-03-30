class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/3703a62578d724b3729d59f1b0c6ada4d30e4e05.tar.gz"
  version "0.5.4+git.20260330.3703a62"
  sha256 "27e237cd34ec077206f3580cada851f5e82ea733eea2867049e658c0af52202a"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
