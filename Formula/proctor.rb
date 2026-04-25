class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  url "https://github.com/nclandrei/proctor/archive/refs/tags/v0.12.0.tar.gz"
  version "0.12.0"
  sha256 "61a62317eb897db3abbe67297e6514093daef80873e94d5793146e08f5f721c6"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    assert_match "proctor", shell_output("#{bin}/proctor --help")
  end
end
