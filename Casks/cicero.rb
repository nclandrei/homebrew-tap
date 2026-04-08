cask "cicero" do
  version "20260408.075318"
  sha256 "3c60e1165c3b8bff842c83911876e0379f4034a818c26318cb924f9208dd3bb2"

  url "https://github.com/nclandrei/cicero/releases/download/v20260408.075318/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
