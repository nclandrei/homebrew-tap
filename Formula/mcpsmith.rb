class Mcpsmith < Formula
  desc "Convert MCP servers into staged, source-grounded skill packs"
  homepage "https://github.com/nclandrei/mcpsmith"
  url "https://github.com/nclandrei/mcpsmith/archive/a73b5f8e1c8126bb60408533002c671db20cc044.tar.gz"
  version "0.3.0+git.20260317.a73b5f8"
  sha256 "b4ee67ccfafaabf0b1ca9cba9fca25204ce3921a6e90f4c791a1c2d8239c2cd8"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Usage: mcpsmith", shell_output("#{bin}/mcpsmith --help")
  end
end
