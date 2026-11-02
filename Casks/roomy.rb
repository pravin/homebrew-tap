cask "roomy" do
  version "1.0.2"
  sha256 "070f968f1d1f4a42e27d6cbfed4a7a8d38bf7513d7f0dc6be5997998a40c335c"

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
