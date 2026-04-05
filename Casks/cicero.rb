cask "cicero" do
  version "20260405.104333"
  sha256 "9ab5f737d617198b415fa943503b7341741515f1faa5b17e67d6b5519dc43092"

  url "https://github.com/nclandrei/cicero/releases/download/v20260405.104333/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
