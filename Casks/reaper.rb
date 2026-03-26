cask "reaper" do
  version "20260326.084715"
  sha256 "539b5c228cea0f9df073f8c0104608da3418a5d5da88bbab13ca79c1f6759a32"

  url "https://github.com/nclandrei/reaper/releases/download/v20260326.084715/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
