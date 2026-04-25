cask "cicero" do
  version "20260425.204717"
  sha256 "8a991cce65867e69813f5bbdbb7d4b2ca248658f1eceb428e29420e38d7a5533"

  url "https://github.com/nclandrei/cicero/releases/download/v20260425.204717/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"
  binary "#{appdir}/Cicero.app/Contents/MacOS/CiceroMCP", target: "cicero-mcp"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
