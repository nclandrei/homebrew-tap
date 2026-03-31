class Mcpsmith < Formula
  desc "Convert MCP servers into staged, source-grounded skill packs"
  homepage "https://github.com/nclandrei/mcpsmith"
  url "https://github.com/nclandrei/mcpsmith/archive/7bf632b989432098f877da331fa2ce87101ea592.tar.gz"
  version "0.4.0+git.20260331.7bf632b"
  sha256 "2fcbad33ac604120c4677af2784becbcefead6ffe6906e623512b4418251edd5"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Usage: mcpsmith", shell_output("#{bin}/mcpsmith --help")
  end
end
