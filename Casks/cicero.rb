cask "cicero" do
  version "20260404.093310"
  sha256 "d2feca7b4dec63d5f9bc53213711a963824bdb09ca7b2878fe0567ae49ebe764"

  url "https://github.com/nclandrei/cicero/releases/download/v20260404.093310/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
