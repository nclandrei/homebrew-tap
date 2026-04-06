cask "cicero" do
  version "20260406.080709"
  sha256 "3fa1832452ddae67628ed4d3f3f0b9c38143b28a1f9ea50fccf54827462d72e4"

  url "https://github.com/nclandrei/cicero/releases/download/v20260406.080709/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
