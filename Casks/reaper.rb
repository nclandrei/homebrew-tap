cask "reaper" do
  version "20260331.080214"
  sha256 "7407d79fbbb91bd69acf3c2f0a38f6c82510833f201878992990b8f49ee8da06"

  url "https://github.com/nclandrei/reaper/releases/download/v20260331.080214/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
