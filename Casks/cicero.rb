cask "cicero" do
  version "20260404.092902"
  sha256 "87db188d36f7f74e98401097e6299229932e698f4f4eb1f65c505247683e643e"

  url "https://github.com/nclandrei/cicero/releases/download/v20260404.092902/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
