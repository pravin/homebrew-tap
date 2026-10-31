class Letterlock < Formula
  desc "Free five-letter word-guessing game for the terminal"
  homepage "https://github.com/pravin/letterlock"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/pravin/letterlock/releases/download/v0.3.0/letterlock-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "7e3a10bb507d6742b604cedd2cd76d98e6d737356aa8d0a60721fe574e1ae3f1"
    end
    on_intel do
      url "https://github.com/pravin/letterlock/releases/download/v0.3.0/letterlock-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "fa6767cf1ac322300632b711baf946121cb1dd697efe2fe5533cdd83a248502e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pravin/letterlock/releases/download/v0.3.0/letterlock-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2fa4c027c64940c0a4cd0b96207a42d8c586fc6eb854b5f60a89abf75a62f0c6"
    end
    on_intel do
      url "https://github.com/pravin/letterlock/releases/download/v0.3.0/letterlock-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "70529ea7d018bc12e4ae9f53d585514052b4eab9f4ecdffdb831354e1dd88049"
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
