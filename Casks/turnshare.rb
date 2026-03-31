cask "turnshare" do
  version "20260331.082619"
  sha256 "62985933516a1e775b16de3ccd5b0f32e8aa02d5fa9845e89fcc9278f4ac4e96"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260331.082619/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
