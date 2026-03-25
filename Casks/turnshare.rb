cask "turnshare" do
  version "20260325.175635"
  sha256 "b6b265c54837d0da3cef9a53a18018ff3d55cae62245309e82584808f6adf954"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260325.175635/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
