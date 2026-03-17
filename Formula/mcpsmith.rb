class Mcpsmith < Formula
  desc "Convert MCP servers into staged, source-grounded skill packs"
  homepage "https://github.com/nclandrei/mcpsmith"
  url "https://github.com/nclandrei/mcpsmith/archive/33c6cfe57dd489f4c5df19fb98b85a255500e465.tar.gz"
  version "0.3.0+git.20260316.33c6cfe"
  sha256 "6af39afb734e70a404fe84f9683e5129b1ba03ae06b8c0643a1d71b08eda4d62"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Usage: mcpsmith", shell_output("#{bin}/mcpsmith --help")
  end
end
