cask "reaper" do
  version "20260326.093300"
  sha256 "32ea73ad8d7dc4f07851119bf9f60eb388e43fa55fdf968a4f6cc9f1dec1d316"

  url "https://github.com/nclandrei/reaper/releases/download/v20260326.093300/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
