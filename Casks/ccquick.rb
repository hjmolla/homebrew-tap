cask "ccquick" do
  version "1.0.0"
  sha256 "8fb0ad03ab2c421911f0632b8ee1f0340deeb83ee84617d8e766bba64cf82d1a"

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
