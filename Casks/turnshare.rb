cask "turnshare" do
  version "20260331.074934"
  sha256 "d91834e56764bc1ba7908ce47d8e8c069d1c3367b482b5899030d5bf802b5e7f"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260331.074934/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
