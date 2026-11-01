cask "roomy" do
  version "1.0.1"
  sha256 "65912da29c4a0d80da6f1de6851cab387c846058f13601a1f414b4dc8578c929"

  url "https://github.com/pravin/roomy/releases/download/v#{version}/Roomy_#{version}_universal.dmg"
  name "Roomy"
  desc "See what's filling your disk and clear out developer junk"
  homepage "https://github.com/pravin/roomy"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Roomy updates itself, so Homebrew shouldn't fight it.
  auto_updates true
  depends_on :macos

  app "Roomy.app"

  zap trash: [
    "~/Library/Application Support/io.github.pravin.roomy",
    "~/Library/Caches/io.github.pravin.roomy",
    "~/Library/WebKit/io.github.pravin.roomy",
  ]

  caveats <<~EOS
    Roomy isn't notarised by Apple yet. If macOS says it can't be opened,
    open System Settings > Privacy & Security and choose "Open Anyway", or run:
      xattr -dr com.apple.quarantine /Applications/Roomy.app
  EOS
end
