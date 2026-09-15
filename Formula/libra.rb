class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.36"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.36/libra-darwin-arm64",
        using: :nounzip
    sha256 "af6e70400a7148d9cf425d4a0ea88e0ffd5c50e2a0aac3f45d1673446ed4b713"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.36/libra-linux-amd64",
        using: :nounzip
    sha256 "c0e81b33221c1afa9785c9e8af2afc95f28c641f7fa9d3cff668f0f8b154a219"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.36/libra-linux-arm64",
        using: :nounzip
    sha256 "d4a1fdc1b1d9e23f2a931d3c03921557578c15ac6b934374ae587cc87e963aa8"
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
