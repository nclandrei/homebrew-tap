class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/4dfcd8201a11da99d756ba109a3e6aecae5ea197.tar.gz"
  version "0.5.6+git.20260330.4dfcd82"
  sha256 "3da383ba7539a314966dab4035a39672e6953cb867c7a944095aac7482b525d3"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
