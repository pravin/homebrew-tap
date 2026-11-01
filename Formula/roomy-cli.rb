class RoomyCli < Formula
  desc "Find out what's filling your disk, and clear out developer junk"
  homepage "https://github.com/pravin/roomy"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pravin/roomy/releases/download/v1.0.0/roomy-cli-1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "38b7bb05551fc268bbf2a34fe73c38f1a1a0c50b60f0501592db508ea8bd98ed"
    end
    on_intel do
      url "https://github.com/pravin/roomy/releases/download/v1.0.0/roomy-cli-1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "43ee5ba1d15bc2827d4c6ec49d86b7a8d1278a2f845722f31493115345b45bc7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pravin/roomy/releases/download/v1.0.0/roomy-cli-1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f92567379d3fe9a2c636af1f0eeb64eb74cb263347a2c5e03c61f17abb55b0f6"
    end
  end

  def install
    bin.install "roomy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/roomy --version")
    (testpath/"folder/file.txt").write "hello"
    assert_match "1 files", shell_output("#{bin}/roomy #{testpath}/folder 2>&1")
  end
end
