cask "cicero" do
  version "20260404.093857"
  sha256 "aeb813c2810609950327db3a297762d62c3d3f619ae672059ee560152bb8d24e"

  url "https://github.com/nclandrei/cicero/releases/download/v20260404.093857/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
