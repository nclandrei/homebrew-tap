cask "turnshare" do
  version "20260329.152243"
  sha256 "a3549c03a4fb25e77a28caa760a350bb10b17b7afe86ca617917ac32afd2ceaf"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260329.152243/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
