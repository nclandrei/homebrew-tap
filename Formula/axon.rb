class Axon < Formula
  desc "macOS accessibility CLI for AI agent workflows"
  homepage "https://github.com/nclandrei/axon"
  url "https://github.com/nclandrei/axon/archive/refs/tags/v0.2.0.tar.gz"
  version "0.2.0"
  sha256 "3c2bdcb9d0fa092d61bd2c2aac18d0ef92b01f87842df25dcc131830bd1ac131"

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
