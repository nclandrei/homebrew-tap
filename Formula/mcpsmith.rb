class Mcpsmith < Formula
  desc "Convert MCP servers into staged, source-grounded skill packs"
  homepage "https://github.com/nclandrei/mcpsmith"
  url "https://github.com/nclandrei/mcpsmith/archive/6dd43964f4dd60f3c0d2cb93c3455ed67cec3608.tar.gz"
  version "0.4.0+git.20260318.6dd4396"
  sha256 "a68b08283ca06aacb4f228a6e31417dd645db2768aebe68e8a3f071d31193c94"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Usage: mcpsmith", shell_output("#{bin}/mcpsmith --help")
  end
end
