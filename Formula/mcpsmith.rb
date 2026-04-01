class Mcpsmith < Formula
  desc "Convert MCP servers into staged, source-grounded skill packs"
  homepage "https://github.com/nclandrei/mcpsmith"
  url "https://github.com/nclandrei/mcpsmith/archive/ed73563aca7384162f80859e01abfaef2f269d50.tar.gz"
  version "0.4.1+git.20260401.ed73563"
  sha256 "6e389a9932af60b0eccb2daf1f14b4e05c94632c871b96311977fffed38e3820"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Usage: mcpsmith", shell_output("#{bin}/mcpsmith --help")
  end
end
