cask "reaper" do
  version "20260326.091346"
  sha256 "04afffea1867c2cd303f46ddb73985961bf6ba6dce06f8787e4bb270cbb7af78"

  url "https://github.com/nclandrei/reaper/releases/download/v20260326.091346/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
