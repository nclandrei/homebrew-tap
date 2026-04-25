cask "turnshare" do
  version "20260425.081733"
  sha256 "1c5025b2bac9990222b317ee8b288c39ea961aac00ff8ef55a592b00db6392cd"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260425.081733/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
