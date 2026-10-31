class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.125"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.125/libra-darwin-arm64",
        using: :nounzip
    sha256 "dfe0095c27087ea438ed6c54d4e7767bfe2e9442fad0469f8142006d9d133c61"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.125/libra-linux-amd64",
        using: :nounzip
    sha256 "083f2c166f0bb5cb63baea77722ce8a76b1757e47b08ef1646add53141acf289"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.125/libra-linux-arm64",
        using: :nounzip
    sha256 "0ddb21d7ed9b9c9834317ac1a276724f5463363646081a8c76b5c69c27f9c058"
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
