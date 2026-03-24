cask "reaper" do
  version "0.1.0"
  sha256 "2b6b6359916769c9a6e2ad19782b61b7a7de044093c56876522c5d24708c1607"

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
