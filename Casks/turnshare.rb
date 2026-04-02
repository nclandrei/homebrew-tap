cask "turnshare" do
  version "20260402.080227"
  sha256 "3d4a8bb007b8a3ef97ac521d2dd72f754195d2b1cba93bdd02ad1a00481c8c41"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260402.080227/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
