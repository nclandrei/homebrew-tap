cask "reaper" do
  version "20260329.153523"
  sha256 "18a798159e69ac314957aa78d67bb20f481caf1f91ed5ccf61653ef0c8404110"

  url "https://github.com/nclandrei/reaper/releases/download/v20260329.153523/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
