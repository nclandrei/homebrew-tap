class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  url "https://static.crates.io/crates/magellan-cli/magellan-cli-0.1.2.crate"
  sha256 "97b0a58d0ace19a2a86e69fc478fedc81b1abf718eaaeebcaf05bbe221e07298"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "magellan", shell_output("#{bin}/magellan --help")
  end
end
