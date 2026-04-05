cask "cicero" do
  version "20260405.082437"
  sha256 "613f1c9e97d89f38697f012e9c66cc97d85eb9afc6b468e9986465a208efafa9"

  url "https://github.com/nclandrei/cicero/releases/download/v20260405.082437/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
