class Letterlift < Formula
  desc "Word-ladder puzzle for the terminal: change one letter at a time"
  homepage "https://github.com/pravin/letterlift"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/pravin/letterlift/releases/download/v0.1.1/letterlift-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "842bcddd61f861a9adc02350718d2124a1296c95923439a82ea6d6fe4e08d6b4"
    end
    on_intel do
      url "https://github.com/pravin/letterlift/releases/download/v0.1.1/letterlift-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "4b477bf0ad1f88ff8145aeade2021edb5b83d22604752cb8b3c811f13ce81ab1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pravin/letterlift/releases/download/v0.1.1/letterlift-v0.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f18a027c3ea5b4c9486d5e5f7656ff0f39877331717a96613dd4e5273598f4de"
    end
    on_intel do
      url "https://github.com/pravin/letterlift/releases/download/v0.1.1/letterlift-v0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "82fbca17081bfb635517333399caef316d489c5a934cdb67257c3341244adab9"
    end
  end

  def install
    bin.install "letterlift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/letterlift --version")
    assert_match "STATISTICS", shell_output("#{bin}/letterlift --stats")
  end
end
