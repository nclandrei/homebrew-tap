cask "turnshare" do
  version "20260420.101141"
  sha256 "518edad072f62bf019827f6f8aae86f16e23376060c0da020ed765b7e28cee1b"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260420.101141/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
