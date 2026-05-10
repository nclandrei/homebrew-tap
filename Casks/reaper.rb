cask "reaper" do
  version "20260510.184631"
  sha256 "31532cd59187265acc2efe65f4826f3d15d1342f0ec8f9448352cbce24da1541"

  url "https://github.com/nclandrei/reaper/releases/download/v20260510.184631/Reaper.zip"
  name "Reaper"
  desc "macOS menu bar process killer with one-click quit"
  homepage "https://github.com/nclandrei/reaper"

  depends_on macos: ">= :sonoma"
  conflicts_with cask: "homebrew/cask/reaper"

  app "Reaper.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.reaper.plist",
  ]
end
