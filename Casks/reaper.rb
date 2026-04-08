cask "reaper" do
  version "20260408.073002"
  sha256 "f9a7de27643e9e6082e63d335b6e1b1204243d8747bbde301a9016c534957f7c"

  url "https://github.com/nclandrei/reaper/releases/download/v20260408.073002/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
