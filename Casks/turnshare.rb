cask "turnshare" do
  version "20260401.112615"
  sha256 "ebce2dd8dcc01a35ac7a20a110cd57f5e81b0eb2f661537fe07608b51eda2998"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260401.112615/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
