cask "reaper" do
  version "20260329.085618"
  sha256 "4f789fcf1e28e1281953cd33c3e62a28845aeab39af07cbf8babb6fc17cde4d0"

  url "https://github.com/nclandrei/reaper/releases/download/v20260329.085618/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
