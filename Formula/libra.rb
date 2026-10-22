class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.85"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.85/libra-darwin-arm64",
        using: :nounzip
    sha256 "b8d13b526bb6e83436398f8ee970bc82e737db923fde24bfa8a96d3b5c49de8e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.85/libra-linux-amd64",
        using: :nounzip
    sha256 "b4def11202e9862ce56b1aaa7040e8d0a91260a2e8a2cf62bceb7dcf851b19bc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.85/libra-linux-arm64",
        using: :nounzip
    sha256 "611e4cff14c4d64c556deaa200ed30af30371f187e5722189d5ce6dd3802a76e"
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
