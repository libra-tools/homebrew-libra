class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.23"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.23/libra-darwin-arm64",
        using: :nounzip
    sha256 "317bb52ae56bc931d1b3b38a3c8b2e919a83f737957863ef0d2531be077805e6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.23/libra-linux-amd64",
        using: :nounzip
    sha256 "c56899f5fe80ac3dac3d1f98847fd1ccb17bd2eafafd56a4bcf07acd2514a263"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.23/libra-linux-arm64",
        using: :nounzip
    sha256 "e4520c954ac1b72fc07330afa5b8b640c2182d6fa6ae02c5179969eb5f4c81a8"
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
