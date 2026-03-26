cask "reaper" do
  version "20260326.095833"
  sha256 "0d8b3edb47db821d3fe10f88d716913f48115b12c28b376bc10935b9279ffa64"

  url "https://github.com/nclandrei/reaper/releases/download/v20260326.095833/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
