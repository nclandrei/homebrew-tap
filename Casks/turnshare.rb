cask "turnshare" do
  version "20260415.095423"
  sha256 "ee9ab647ce44e868fb40a543a7e51ec243a0f66e88c3ac1906e2854202f99ecb"

  url "https://github.com/nclandrei/turnshare/releases/download/v20260415.095423/Turnshare.zip"
  name "Turnshare"
  desc "macOS menu bar app for sharing AI coding sessions via GitHub Gists"
  homepage "https://github.com/nclandrei/turnshare"

  depends_on macos: ">= :sonoma"

  app "Turnshare.app"

  zap trash: [
    "~/Library/Preferences/com.nclandrei.turnshare.plist",
  ]
end
