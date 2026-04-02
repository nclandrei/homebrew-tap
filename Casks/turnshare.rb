cask "turnshare" do
  version "20260402.085905"
  sha256 "f5f44029817c62445df777462b759a8fb9430a7ae1f80946440c287b153ddf08"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260402.085905/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
