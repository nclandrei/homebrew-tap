cask "reaper" do
  version "20260329.151609"
  sha256 "0ae169e7b2ed4df31d2781db996ef8207d32000d7dd576e04962a3c4284c9043"

  url "https://github.com/nclandrei/reaper/releases/download/v20260329.151609/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
