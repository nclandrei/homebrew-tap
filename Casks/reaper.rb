cask "reaper" do
  version "20260326.095255"
  sha256 "56140bc2237adb30a85474a46eb0a46133d2988cbb88002bb5ff3e42d8786e00"

  url "https://github.com/nclandrei/reaper/releases/download/v20260326.095255/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
