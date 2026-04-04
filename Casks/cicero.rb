cask "cicero" do
  version "20260404.084215"
  sha256 "32115d894ba25e231abbbdf9562d881716049e5c952de643e5b567c5787be659"

  url "https://github.com/nclandrei/cicero/releases/download/v20260404.084215/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
