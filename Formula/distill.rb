class Distill < Formula
  desc "Monitor AI agent sessions and propose reusable skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/00f18a39957a645b67dbec4c6cdc54ea932a45bd.tar.gz"
  version "0.6.3+git.20260402.00f18a3"
  sha256 "d28d2629308da85c114b5265dd9239b53c6a6d042ded79c782cb38f07b49bb1d"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
  end
end
