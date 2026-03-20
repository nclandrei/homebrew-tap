cask "turnshare" do
  version "20260320.093308"
  sha256 "e5796c41c8b6fb824992f3d7484b4e2dc8338ec4296baf16bc80a234ccfaa4a2"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260320.093308/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
