cask "turnshare" do
  version "20260325.165502"
  sha256 "091b0e3092a7000cd09a20003aa5713be10b66002cebf0ffdcc6741832cedfbc"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260325.165502/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
