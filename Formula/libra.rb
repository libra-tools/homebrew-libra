class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.15"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.15/libra-darwin-arm64",
        using: :nounzip
    sha256 "dbd0206fb5395040ec28578698e88cf4d440ffb511d2eb1b9404acc629c2bd6b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.15/libra-linux-amd64",
        using: :nounzip
    sha256 "531c67f93de61525a7f12a0f3eaaf4b4cd0aea5da74614ec08e126d213ad53d3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.15/libra-linux-arm64",
        using: :nounzip
    sha256 "b44812b78c5df01928603af4bce0e5d0533d89fe1d03f8897eb2a930be0270d4"
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
