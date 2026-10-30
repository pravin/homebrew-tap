class Letterlock < Formula
  desc "Free five-letter word-guessing game for the terminal"
  homepage "https://github.com/pravin/letterlock"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/pravin/letterlock/releases/download/v0.2.0/letterlock-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "e1dae087ab24abad018dca4cf156508864f347ed9bb18ad4aa99bc3d6da89d64"
    end
    on_intel do
      url "https://github.com/pravin/letterlock/releases/download/v0.2.0/letterlock-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "70ab25fc18f6a5fbe0e6ca04189c615c973adf48287b90984aa3316c13134ded"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pravin/letterlock/releases/download/v0.2.0/letterlock-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ebf82bc93c3d680401a278f7b54fdaff79b79da1e9355a68f17ef584c5def483"
    end
    on_intel do
      url "https://github.com/pravin/letterlock/releases/download/v0.2.0/letterlock-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f34b290e0d192a08dbd66d6b43f54f5b5e70678d5d6bd75d8b52742f5192c4af"
    end
  end

  def install
    bin.install "letterlock"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/letterlock --version")
    assert_match "Games played", shell_output("#{bin}/letterlock --stats")
  end
end
