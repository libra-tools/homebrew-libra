class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.209"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.209/libra-darwin-arm64",
        using: :nounzip
    sha256 "0619ca2c93c86a29ccc84be5ce87f94cfaea6bb51fae340a31d467c31136e1f7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.209/libra-linux-amd64",
        using: :nounzip
    sha256 "5c45d7ebf79f97d340031c5d49f2ea537b1780ce71a5436fc7b07afd9c93734d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.209/libra-linux-arm64",
        using: :nounzip
    sha256 "0b9d0371c9a0c2c427c838505831f08db31bf4892b54ef41a247522696a14835"
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
