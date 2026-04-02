cask "turnshare" do
  version "20260402.080524"
  sha256 "d5b315e8df0f5b9c596539534b508f3a8ac81ee6fe58f586ba9981490f95c3b4"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260402.080524/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
