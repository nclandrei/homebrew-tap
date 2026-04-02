class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  url "https://github.com/nclandrei/proctor/archive/960d61f98fab1e3c57dac1f14610e92f97ee74e2.tar.gz"
  version "0.6.0+git.20260402.960d61f"
  sha256 "f27a9f4bd63a3f53ffdff5551dcca91e516dc018b896f4f3b17fa0d0808a9eaf"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    output = shell_output("#{bin}/proctor --help")
    assert_match "make a coding agent prove it manually tested its own work", output
    assert_match "Codex, Claude Code", output
  end
end
