cask "turnshare" do
  version "20260320.084600"
  sha256 "ccf6f4ee7205a90c0c09da1596332eb137c1ee6dd9d33761b8fc01ba5df811d0"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260320.084600/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
