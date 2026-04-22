cask "cicero" do
  version "20260422.181542"
  sha256 "739f8a3cc29df0459d74412d7b4a053d89e00669bedae9ca5d46e51fb4e58bdd"

  url "https://github.com/nclandrei/cicero/releases/download/v20260422.181542/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
