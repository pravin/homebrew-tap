class Letterlock < Formula
  desc "Free five-letter word-guessing game for the terminal"
  homepage "https://github.com/pravin/letterlock"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/pravin/letterlock/releases/download/v0.3.1/letterlock-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "b362a088b495568b937663e26430857bd2d373df417304fe65f9583a6e48d127"
    end
    on_intel do
      url "https://github.com/pravin/letterlock/releases/download/v0.3.1/letterlock-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "0128b185bfdc81735b3406bbdf5db6b7c1a38f53c495a812208ab781cb8fb5f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pravin/letterlock/releases/download/v0.3.1/letterlock-v0.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f310a8f7beaae3275e770dad29c1edba6c7278e952e4ecdb0589b70f21198b98"
    end
    on_intel do
      url "https://github.com/pravin/letterlock/releases/download/v0.3.1/letterlock-v0.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "655918ce3ec5c094c1763ac38a84e06a663335ead6d1819b833bc2d9822e64b2"
    end
  end

  def install
    bin.install "letterlock"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/letterlock --version")
    assert_match "STATISTICS", shell_output("#{bin}/letterlock --stats")
  end
end
