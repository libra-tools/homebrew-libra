class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.38"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.38/libra-darwin-arm64",
        using: :nounzip
    sha256 "5549d0ccb13f0d5244edd404f98585cff549b99ea8f28374f821b49dde3a189b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.38/libra-linux-amd64",
        using: :nounzip
    sha256 "f0a7da88207f81097cb2b131c2d0f5c4cb7c8056cd1abf4aaceb37fe62dad18a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.38/libra-linux-arm64",
        using: :nounzip
    sha256 "8791c9bd809380c3e2a5153c77eae402b3105b450d909e7b744afc3fe5d4f2d1"
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
