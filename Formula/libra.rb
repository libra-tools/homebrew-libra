class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.16"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.16/libra-darwin-arm64",
        using: :nounzip
    sha256 "42bcbefb3e1b6d206e7cc410ec9ae40b17c748fddae545eff53bb2b3167c7e44"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.16/libra-linux-amd64",
        using: :nounzip
    sha256 "d04f6221e4a8aa77f118e287fa2eba7e45a0b3520e2e9f10f2a1a81b7c0a6f55"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.16/libra-linux-arm64",
        using: :nounzip
    sha256 "b359610b2458e01088bba18fee072541c555ba3f81a2d4363957ce8329e60d9b"
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
