class Teller < Formula
  desc "AI-powered financial assistant for managing documents and transactions"
  homepage "https://github.com/nclandrei/teller"
  url "https://github.com/nclandrei/teller/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/teller"
  end

  test do
    assert_match "teller", shell_output("#{bin}/teller --help 2>&1", 1)
  end
end
