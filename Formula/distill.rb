class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/89b96d067cfe341a33dda477bb6f60592cf3b846.tar.gz"
  version "0.5.6+git.20260331.89b96d0"
  sha256 "ec5294ab264ed2acbeb62683f97c815232d5f8214c600d236ba415bdbaccc7bf"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
