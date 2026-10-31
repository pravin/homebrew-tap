class Letterlift < Formula
  desc "Word-ladder puzzle for the terminal: change one letter at a time"
  homepage "https://github.com/pravin/letterlift"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/pravin/letterlift/releases/download/v0.1.0/letterlift-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "4d26e20b4fc2a5817bba5b8f3f63cc2869b4d24ccdc6231f855536f0124825fd"
    end
    on_intel do
      url "https://github.com/pravin/letterlift/releases/download/v0.1.0/letterlift-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "600786c7f4a81523d44abb6b99720b49cfb67411b46dbef4d24d9ab7911438eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pravin/letterlift/releases/download/v0.1.0/letterlift-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b352b5fca6d0ff0c847d273be9d8543f023f7e460fc3abce7232f17f2d185aec"
    end
    on_intel do
      url "https://github.com/pravin/letterlift/releases/download/v0.1.0/letterlift-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2155a5dd906a19e60b1c1ffa5c2a5532b676993a996f7d2f93a943934a4ef76d"
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
