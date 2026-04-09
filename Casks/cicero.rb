cask "cicero" do
  version "20260409.073404"
  sha256 "67ddebbd4b18cbd2d769779291ecb60faf4e1e0165eef9de4066f2ee84016496"

  url "https://github.com/nclandrei/cicero/releases/download/v20260409.073404/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
