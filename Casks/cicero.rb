cask "cicero" do
  version "20260404.074514"
  sha256 "197ed10f0945c98b1d020ae76914fd6f86891304dfdfc50550e6076cfdad8187"

  url "https://github.com/nclandrei/cicero/releases/download/v20260404.074514/Cicero.zip"
  name "Cicero"
  desc "AI-native macOS presentation app for developers"
  homepage "https://github.com/nclandrei/cicero"

  depends_on macos: ">= :sonoma"

  app "Cicero.app"

  zap trash: [
    "~/Library/Preferences/com.andreinicolas.Cicero.plist",
  ]
end
