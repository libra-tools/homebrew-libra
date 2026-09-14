class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.26"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.26/libra-darwin-arm64",
        using: :nounzip
    sha256 "abf3e4d3b63f9ce637ae6253f520e4f5a12e86c46718f0d67f14f52735c88ebc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.26/libra-linux-amd64",
        using: :nounzip
    sha256 "6d6599a2babab22a14bbe0a001f47f98d4205ae13f3e55142b845d0fb8b6ccb1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.26/libra-linux-arm64",
        using: :nounzip
    sha256 "a068da34848675e4fe83efbb3c32acdf5542015acd98c043f722f1bd46fe7006"
  else
    odie "Libra does not publish a Homebrew binary for this platform yet."
  end

  def install
    binary = Dir["libra-*"].first
    odie "Downloaded Libra binary was not staged" unless binary

    chmod 0755, binary
    bin.install binary => "libra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/libra --version")
  end
end
