cask "cicero" do
  version "20260405.093204"
  sha256 "49f83d73df1c2f59d5e6ed1916fe3cf9727b3cc93bcb0114c5e22218582cc969"

  url "https://github.com/nclandrei/cicero/releases/download/v20260405.093204/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
