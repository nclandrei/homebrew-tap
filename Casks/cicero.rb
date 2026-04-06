cask "cicero" do
  version "20260406.081117"
  sha256 "6ef4117ffa536eeb24617be4a2fbdf6f6bbe11b6ae6ed3674012fdf86c6680d1"

  url "https://github.com/nclandrei/cicero/releases/download/v20260406.081117/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
