cask "reaper" do
  version "20260326.100926"
  sha256 "6eb1a16bdb8cbfe087bb011278aadfb5269785fc62f62cae3440e122f9c29c19"

  url "https://github.com/nclandrei/reaper/releases/download/v20260326.100926/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
