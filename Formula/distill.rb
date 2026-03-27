class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/6c10b7cf688c3ddcfa7b577229a3d0e35314f111.tar.gz"
  version "0.5.4+git.20260327.6c10b7c"
  sha256 "5fb0380cec9c1477d5f985fb4f66992ba91024e01970eff24a24af85754c8bf9"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
