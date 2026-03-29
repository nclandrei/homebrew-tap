cask "turnshare" do
  version "20260329.150422"
  sha256 "401a2f7efc9e38e5c275b255699165048b5b9f5c1e84ed10af3b7305503c21d2"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260329.150422/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
