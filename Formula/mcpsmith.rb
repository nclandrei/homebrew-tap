class Mcpsmith < Formula
  desc "Convert MCP servers into source-grounded skill packs with staged review and verify steps"
  homepage "https://crates.io/crates/mcpsmith"
  url "https://static.crates.io/crates/mcpsmith/mcpsmith-0.3.0.crate"
  version "0.3.0"
  sha256 "31a437544ad95af5ead60a951987f4ee48744f2946a5a029bceb3ab3742d566b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Usage: mcpsmith", shell_output("#{bin}/mcpsmith --help")
  end
end
