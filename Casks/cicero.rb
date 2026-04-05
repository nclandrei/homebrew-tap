cask "cicero" do
  version "20260405.084005"
  sha256 "6aff7775f1ba41d1415b79cfe37a0e05faddbcec2b81bb281959d2d9644e5b19"

  url "https://github.com/nclandrei/cicero/releases/download/v20260405.084005/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
