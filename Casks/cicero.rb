cask "cicero" do
  version "20260405.081044"
  sha256 "2bb67a688e20ee64524ac067cf11b9c500594dbba36f3c9152e96d2216b092fc"

  url "https://github.com/nclandrei/cicero/releases/download/v20260405.081044/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
