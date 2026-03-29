cask "turnshare" do
  version "20260329.151649"
  sha256 "ed705ffe2dddac9e92d3696054ea7b0f5df3edff3c142fa60c86ceb20bf67fc1"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260329.151649/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
