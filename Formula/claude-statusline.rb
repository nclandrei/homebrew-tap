class ClaudeStatusline < Formula
  desc "Minimal statusline renderer for Claude Code"
  homepage "https://github.com/nclandrei/claude-statusline"
  url "https://github.com/nclandrei/claude-statusline/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f4272963e76414851b075230127eb4ba72e13b74c9c0e1368de0489ab0c2efcf"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    input = '{"model":{"display_name":"Opus"},"workspace":{"current_dir":"/tmp/test"},"context_window":{"used_percentage":42.7}}'
    output = pipe_output("#{bin}/claude-statusline", input)
    assert_match "Opus", output
    assert_match "test", output
    assert_match "42%", output
  end
end
