class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.17"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.17/libra-darwin-arm64",
        using: :nounzip
    sha256 "3805bc3c0c88bb4c980430e2731852e926d63d97c008b26f16304acb4d02028e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.17/libra-linux-amd64",
        using: :nounzip
    sha256 "491aab2d7744f4ce9b3a5857ce15978a99fbe7a307dd0621bac62b174acc8567"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.17/libra-linux-arm64",
        using: :nounzip
    sha256 "23cc0ec5d9249219ddd69321f35069d163da4a2049a25cce278f67b2dcbe7504"
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
