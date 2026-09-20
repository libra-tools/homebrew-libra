class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.22"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.22/libra-darwin-arm64",
        using: :nounzip
    sha256 "ca9b12e3e471ac3c9002e05509952418674f618af5f6c1eeaf4007d1fbf9f73e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.22/libra-linux-amd64",
        using: :nounzip
    sha256 "7fcf60e9f5454c0f8429771501e346eec9d98afa02f579b2c53a1dfe69d4dea5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.22/libra-linux-arm64",
        using: :nounzip
    sha256 "6a6a86f86135086d1bbe478b4215d6dfbcd3a488ab869621f2ae6d2e1adb7ee6"
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
