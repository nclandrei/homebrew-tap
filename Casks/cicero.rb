cask "cicero" do
  version "20260504.161044"
  sha256 "dac5be2f53a6a6834e6a23acb34162fa12a63aa0b951eec620c298fe242aa262"

  url "https://github.com/nclandrei/cicero/releases/download/v20260504.161044/Cicero.zip"
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
