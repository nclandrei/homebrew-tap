cask "reaper" do
  version "20260324.133117"
  sha256 "21a731d67cbdd49a2949161f956106de9d106ddfbc258eaa05d0afd9b1547170"

  url "https://github.com/nclandrei/reaper/releases/download/v20260324.133117/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
