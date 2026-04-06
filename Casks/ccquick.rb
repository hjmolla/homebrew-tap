cask "ccquick" do
  version "1.0.0"
  sha256 "b9005cfb0aebe1cb7fa451451801188f89ff56af1d5171d55b02ea7ed2c6d2ff"

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
