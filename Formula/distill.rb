class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/88f6dd107926880b69a5964c8c935efe778ea71c.tar.gz"
  version "0.5.3+git.20260318.88f6dd1"
  sha256 "c5d3d980135a2a27a4676a3c865d7f56682c224f5a2ffd00ab9829db81e928a8"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
