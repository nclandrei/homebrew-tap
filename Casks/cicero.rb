cask "cicero" do
  version "20260403.070420"
  sha256 "2cca7fc6d3542dfb03c90be3d082572342adf9f997ef35c3a663773a02531916"

  url "https://github.com/nclandrei/cicero/releases/download/v20260403.070420/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
