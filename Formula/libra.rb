class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.53"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.53/libra-darwin-arm64",
        using: :nounzip
    sha256 "11dfd46ed8eddeb51621a5ada67e04c4687e267712e52e7b5b03fe01ffbc175d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.53/libra-linux-amd64",
        using: :nounzip
    sha256 "ab23e854d926a14d82c57bf543c595932c6351c9fca958fd8ae34a95aead46a5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.53/libra-linux-arm64",
        using: :nounzip
    sha256 "719405a2611249e6e5756350b44eb572b7dbe79ab61dfc69356d8c783a38c304"
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
