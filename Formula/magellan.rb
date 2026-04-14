class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  url "https://github.com/nclandrei/magellan/archive/98d5a0e58f888d7ecfaf9d0a158cf879fbe4b891.tar.gz"
  version "0.5.0+git.20260413.98d5a0e"
  sha256 "6de99aa9de560e68635aadf1127fa66733e23b39338011907b3ce0ede6553045"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "magellan", shell_output("#{bin}/magellan --help")
  end
end
