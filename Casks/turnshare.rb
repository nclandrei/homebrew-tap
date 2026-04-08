cask "turnshare" do
  version "20260408.073957"
  sha256 "5613295c7a9098a5099c6d3e5c7f687004c0b29e60b42dd29d31667488da067b"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260408.073957/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
