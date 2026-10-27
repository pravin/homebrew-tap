class Uketuner < Formula
  desc "A console utility to tune your ukulele"
  homepage "https://github.com/pravin/Ukulele-Tuner"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/pravin/Ukulele-Tuner/releases/download/v0.2.0/uketuner-aarch64-apple-darwin.tar.xz"
      sha256 "51e36175fe58c4199623cb8595ccad2846a44f65c187b688124ef16df08627d9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/pravin/Ukulele-Tuner/releases/download/v0.2.0/uketuner-x86_64-apple-darwin.tar.xz"
      sha256 "79d17cfd564f227a3f3eafa2f5fcfcde64e60c29df8ae5ef1a682fc735550de6"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/pravin/Ukulele-Tuner/releases/download/v0.2.0/uketuner-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c4a28b08858fa3b3e6110ddec716e508ba8b33443fb654c2a7d1be6f92b34c92"
    end
    if Hardware::CPU.intel?
      url "https://github.com/pravin/Ukulele-Tuner/releases/download/v0.2.0/uketuner-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4bd190b8c51326d2f5e9f8f096069cd16d4fb1dddaafd41c889a5f058318df19"
    end
  end
  license "GPL-3.0-or-later"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "uketuner"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "uketuner"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "uketuner"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "uketuner"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
