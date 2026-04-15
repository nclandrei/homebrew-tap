class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  url "https://github.com/nclandrei/magellan/archive/4e5288f83f98881d657e3fdd531cb49636f492d0.tar.gz"
  version "0.6.0+git.20260415.4e5288f"
  sha256 "85d11dcf3ad0d203a83811967b4e2532466e0c30843c874192884423c6126f5e"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "magellan", shell_output("#{bin}/magellan --help")
  end
end
