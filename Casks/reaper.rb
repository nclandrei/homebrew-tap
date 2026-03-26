cask "reaper" do
  version "20260326.092545"
  sha256 "5e1a7761b53da0310b168df671ed51db6281202d7e54cb1ec6645883836e9c8e"

  url "https://github.com/nclandrei/reaper/releases/download/v20260326.092545/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
