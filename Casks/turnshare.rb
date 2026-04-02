cask "turnshare" do
  version "20260402.083638"
  sha256 "509ba5d1f255b9fef2930b41df34807682c6ee8edab0943f5f7fb13020b6fa1d"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260402.083638/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
