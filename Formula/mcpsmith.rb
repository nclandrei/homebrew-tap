class Mcpsmith < Formula
  desc "Convert MCP servers into staged, source-grounded skill packs"
  homepage "https://github.com/nclandrei/mcpsmith"
  url "https://github.com/nclandrei/mcpsmith/archive/08669e96c4a50e4120d3d69cfd551ee6668728d4.tar.gz"
  version "0.4.1+git.20260404.08669e9"
  sha256 "aad5cd36f06be8b285ea301aca0fa2e9e7799fdc56570d2f1222dcbd0247f340"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Usage: mcpsmith", shell_output("#{bin}/mcpsmith --help")
  end
end
