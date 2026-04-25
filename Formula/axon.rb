class Axon < Formula
  desc "macOS accessibility CLI for AI agent workflows"
  homepage "https://github.com/nclandrei/axon"
  url "https://github.com/nclandrei/axon/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "243516cd81e15379f0198f7c4c365127e7ab12794714941f71108affb680138d"

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
