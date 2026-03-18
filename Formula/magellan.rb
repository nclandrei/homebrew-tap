class Magellan < Formula
  desc "Deterministic presentation engine for AI-generated technical walkthroughs"
  homepage "https://github.com/nclandrei/magellan"
  url "https://github.com/nclandrei/magellan/archive/f35ce1fd29ffc1166f62a0c370f7b8edfa48130a.tar.gz"
  version "0.1.3+git.20260318.f35ce1f"
  sha256 "28db776663322f60451eb8b4c3d962398acf381cd79436b8892a4bbd98bb38af"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "magellan", shell_output("#{bin}/magellan --help")
  end
end
