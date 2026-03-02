class Distill < Formula
  desc "CLI tool that monitors AI agent sessions, identifies patterns, and proposes skills"
  homepage "https://github.com/nclandrei/distill"
  url "https://github.com/nclandrei/distill/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1d576e0ca88cd1e661067272a7d6f5a65655d70a7ce56d91b6223b3ad6e950ba"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "distill", shell_output("#{bin}/distill --help")
    assert_match version.to_s, shell_output("#{bin}/distill --version")
  end
end
