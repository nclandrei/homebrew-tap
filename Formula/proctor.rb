class Proctor < Formula
  desc "Manual verification contract CLI for coding agents"
  homepage "https://github.com/nclandrei/proctor"
  url "https://github.com/nclandrei/proctor/archive/710878c1e2606f8b5dd8f0d2230deaa15b2a3d42.tar.gz"
  version "0.7.0+git.20260405.710878c"
  sha256 "436127200516c34d49673a5470b9d864a1aa64e8def0327f99ff64e3bc75dc10"

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
