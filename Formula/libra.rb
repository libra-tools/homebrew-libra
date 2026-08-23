class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.20"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.20/libra-darwin-arm64",
        using: :nounzip
    sha256 "30da72ec7e57f989658c2f1307a5c95d243ab8a10b45337dcb87b12a3c7aea6b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.20/libra-linux-amd64",
        using: :nounzip
    sha256 "22fcffca2dd608eb8802e3c8a2bd8b7f901814c72c7e5c74b2372dc90aa304a3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.20/libra-linux-arm64",
        using: :nounzip
    sha256 "2c6c404c9bef98af195360f4d8158e1a09ba45e2ca8ca1e4173698d01dc8888d"
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
