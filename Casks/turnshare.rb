cask "turnshare" do
  version "20260320.170146"
  sha256 "b5df706d505f519176bab56109429a395f7bbcbd00a90f78bab4b50b56c7ff57"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260320.170146/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
