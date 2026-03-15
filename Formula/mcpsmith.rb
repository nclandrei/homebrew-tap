class Mcpsmith < Formula
  desc "Convert MCP servers into source-grounded skill packs with staged review and verify steps"
  homepage "https://crates.io/crates/mcpsmith"
  url "https://static.crates.io/crates/mcpsmith/mcpsmith-0.2.0.crate"
  version "0.2.0"
  sha256 "831a231a3f4884e2f788a8d96eeb27a855b67d232461f65a7baf7a1056251407"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Usage: mcpsmith", shell_output("#{bin}/mcpsmith --help")
  end
end
