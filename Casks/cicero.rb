cask "cicero" do
  version "20260502.181243"
  sha256 "638a711760f78a2d12cd4f376220c59d06d3c95652b293ab52bf64bb5faec70d"

  url "https://github.com/nclandrei/cicero/releases/download/v20260502.181243/Cicero.zip"
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
