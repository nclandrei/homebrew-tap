cask "turnshare" do
  version "20260404.093750"
  sha256 "256e4ae049569e55d2ad917c26711388dce6bc5bbba9d23a83d7cac8a9330db1"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260404.093750/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
