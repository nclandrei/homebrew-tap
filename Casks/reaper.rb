cask "reaper" do
  version "20260329.161824"
  sha256 "a247f8cee6a75ee53c3c429a0c155faa0b6ed0c0bdeffe5924f215b97f84858b"

  url "https://github.com/nclandrei/reaper/releases/download/v20260329.161824/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
