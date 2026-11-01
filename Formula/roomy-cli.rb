class RoomyCli < Formula
  desc "Find out what's filling your disk, and clear out developer junk"
  homepage "https://github.com/pravin/roomy"
  version "1.0.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pravin/roomy/releases/download/v1.0.1/roomy-cli-1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "dcbd8c91abca4ee3ec6ca398cbfecfc3c3789093a62caee1463f29b42f2b51aa"
    end
    on_intel do
      url "https://github.com/pravin/roomy/releases/download/v1.0.1/roomy-cli-1.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "05cbb1c2305c69d3fe51bbb4d8c9f6bb99b242162a2cac14267649a230edde7d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pravin/roomy/releases/download/v1.0.1/roomy-cli-1.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "979b68a3d7caa1df8787b08d823e1d0e171355886d78df38ceed9c9e71eb8fda"
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
