class Axon < Formula
  desc "macOS accessibility CLI for AI agent workflows"
  homepage "https://github.com/nclandrei/axon"
  url "https://github.com/nclandrei/axon/archive/refs/tags/v0.2.1.tar.gz"
  version "0.2.1"
  sha256 "b48889df55048fe206334619fbf98f07a557299daf8158574679c889fab7ee51"

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
