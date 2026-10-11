class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.43"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.43/libra-darwin-arm64",
        using: :nounzip
    sha256 "3918ea5d1fcadf181b3b983ef972b7c27bca1c06e9e3187db80db095b43f0fb4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.43/libra-linux-amd64",
        using: :nounzip
    sha256 "4a98e90157cec79ddef3c62968f159ef8543192fbe6a232a568f6bc54dbbb20c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.43/libra-linux-arm64",
        using: :nounzip
    sha256 "6f3cb8e6006172315ee78ead6851421880b707d05369fd6aecdbcbe2da43b3c0"
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
