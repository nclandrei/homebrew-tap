cask "reaper" do
  version "20260330.081019"
  sha256 "823b3698b2f47e8d7b875ce588de205996ee561ad31c8726f7b3e28466562220"

  url "https://github.com/nclandrei/reaper/releases/download/v20260330.081019/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
