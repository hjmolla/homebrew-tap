cask "ccquick" do
  version "1.0.0"
  sha256 "948f0a64e0a698c8b1a03d5441e75ac55bda482da32c3e7dddefd728716a20ff"

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
