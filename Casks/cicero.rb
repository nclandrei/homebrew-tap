cask "cicero" do
  version "20260403.072148"
  sha256 "5e977b4086bba31bbe737e91c0fc4cd1c826c09f5943e7291f44c147c2bf83f7"

  url "https://github.com/nclandrei/cicero/releases/download/v20260403.072148/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
