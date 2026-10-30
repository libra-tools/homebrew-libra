class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.103"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.103/libra-darwin-arm64",
        using: :nounzip
    sha256 "e07f1e4140af78e6ff953d734c7a09006b00eeb55865e590664c836981fca2fb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.103/libra-linux-amd64",
        using: :nounzip
    sha256 "7ed2e812e58d8d62a4198cf22efe85d79064cc018fb7c12c8d91da3f18e4e74f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.103/libra-linux-arm64",
        using: :nounzip
    sha256 "cc68751303c191836336fa23f767d67a8c7bd3631a10a8df85d91cdd214da812"
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
