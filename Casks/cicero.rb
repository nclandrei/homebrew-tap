cask "cicero" do
  version "20260405.081637"
  sha256 "c4ddddf51bae1797b5f0c144e50e25803fadc98f45d6e40e591182290aacdb8d"

  url "https://github.com/nclandrei/cicero/releases/download/v20260405.081637/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
