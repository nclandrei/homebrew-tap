class Axon < Formula
  desc "macOS accessibility CLI for AI agent workflows"
  homepage "https://github.com/nclandrei/axon"
  url "https://github.com/nclandrei/axon/archive/refs/tags/v0.3.0.tar.gz"
  version "0.3.0"
  sha256 "cb108e8222e5e02951770888c6560838291432919d73bed56c2663469fcc8614"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/axon"
  end

  test do
    assert_match "axon", shell_output("#{bin}/axon --help")
  end
end
