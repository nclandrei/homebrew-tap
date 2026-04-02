cask "turnshare" do
  version "20260402.075657"
  sha256 "7fc6caaaf52e8b074cf31c7f9e84651ce61dfee5cfe1cfe026fbf6b7af3fb904"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260402.075657/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
