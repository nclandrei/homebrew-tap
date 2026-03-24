cask "reaper" do
  version "0.0.0"
  sha256 :no_check

  url "https://github.com/nclandrei/reaper/releases/download/v#{version}/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
