class Mcpsmith < Formula
  desc "Convert MCP servers into source-grounded skill packs with staged review and verify steps"
  homepage "https://crates.io/crates/mcpsmith"
  url "https://static.crates.io/crates/mcpsmith/mcpsmith-0.1.0.crate"
  version "0.1.0"
  sha256 "6673a38641772d88eb631e047e0504a3f49c51eee111207c6398367d45e6029c"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Usage: mcpsmith", shell_output("#{bin}/mcpsmith --help")
  end
end
