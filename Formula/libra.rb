class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.50"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.50/libra-darwin-arm64",
        using: :nounzip
    sha256 "4ead837a57148d8de61c3c1bc3571a6b9c5d3d7ea99143c13f0cf4b78a22d5b4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.50/libra-linux-amd64",
        using: :nounzip
    sha256 "5e9eb793a8c1623dbcc636d08af737603cc42b192d4f741cc95dff58b7aae5ef"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.50/libra-linux-arm64",
        using: :nounzip
    sha256 "a841ad0620bce5cf6ac9d0cfe4f4b9f38460c2b2a015454c668b3061c82f79e5"
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
