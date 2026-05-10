cask "cicero" do
  version "20260510.185935"
  sha256 "b912fa8818281f04eaab4b44f8713affe60cae66c59281bde58ad6daef0c1115"

  url "https://github.com/nclandrei/cicero/releases/download/v20260510.185935/Cicero.zip"
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
