cask "ccquick" do
  version "1.0.0"
  sha256 "fdb0fd8ae9aa07e107d1a3ecba5b45ba3b340b3e25057b58afa47476ee59faba"

  url "https://github.com/hjmolla/ccquick/releases/download/v#{version}/CCQuick-#{version}.dmg"
  name "CCQuick"
  desc "Quick access to Claude Code from anywhere on your Mac"
  homepage "https://github.com/hjmolla/ccquick"

  depends_on macos: ">= :sequoia"

  app "CCQuick.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/CCQuick.app"]
  end

  zap trash: [
    "~/Library/Application Support/CCQuick",
    "~/Library/Preferences/com.ccquick.app.plist",
    "~/Library/LaunchAgents/com.ccquick.app.plist",
  ]
end
