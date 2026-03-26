cask "turnshare" do
  version "20260326.100909"
  sha256 "6f6f5af4164288e7fca82a4d3baae538d1652db3b41f9c847a7b1bc9a265e09a"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260326.100909/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
