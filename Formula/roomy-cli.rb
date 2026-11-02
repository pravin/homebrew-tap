class RoomyCli < Formula
  desc "Find out what's filling your disk, and clear out developer junk"
  homepage "https://github.com/pravin/roomy"
  version "1.0.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pravin/roomy/releases/download/v1.0.2/roomy-cli-1.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "1f69d48259fba9cc2d1970ec78e8fbcfe7aab45b926da15846e1c04cc629daff"
    end
    on_intel do
      url "https://github.com/pravin/roomy/releases/download/v1.0.2/roomy-cli-1.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "0920b7bbdc33981ccbd81b773c22551f56febb3f385680798051901d1aa3cf82"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pravin/roomy/releases/download/v1.0.2/roomy-cli-1.0.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a7785ec231b39f8f9e763f0b62dd226f2a1776f8fe819caadd6289f6b9e3818b"
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
