cask "turnshare" do
  version "20260318.141150"
  sha256 "62a24600fd2cabad7977f92cf805359975a22f172d89da12c587239f7f11d644"

  url "https://github.com/nclandrei/turnshare/releases/download/v#{version}/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
