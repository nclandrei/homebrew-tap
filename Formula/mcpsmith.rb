class Mcpsmith < Formula
  desc "Convert MCP servers into staged, source-grounded skill packs"
  homepage "https://github.com/nclandrei/mcpsmith"
  url "https://github.com/nclandrei/mcpsmith/archive/ea0b1b0abc4d8b8464640c081a2843b3fc4e1c80.tar.gz"
  version "0.4.0+git.20260317.ea0b1b0"
  sha256 "60709fcc0368104ab392460444f64616cef31166a546d51717ed163328b1d4be"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Usage: mcpsmith", shell_output("#{bin}/mcpsmith --help")
  end
end
