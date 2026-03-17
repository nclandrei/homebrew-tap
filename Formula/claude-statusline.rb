class ClaudeStatusline < Formula
  desc "Minimal statusline renderer for Claude Code"
  homepage "https://github.com/nclandrei/claude-statusline"
  url "https://github.com/nclandrei/claude-statusline/archive/44be0b6ebb058ea37ce8e25c291016ace5cacc8c.tar.gz"
  version "0.1.0+git.20260216.44be0b6"
  sha256 "1f4b583efed6b9850a527596a8474f171fbb02ab49d105a1d62efb070b2eddf6"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    input = '{"model":{"display_name":"Opus"},' \
            '"workspace":{"current_dir":"/tmp/test"},' \
            '"context_window":{"used_percentage":42.7}}'
    output = pipe_output("#{bin}/claude-statusline", input)
    assert_match "Opus", output
    assert_match "test", output
    assert_match "42%", output
  end
end
