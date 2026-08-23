class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.18"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.18/libra-darwin-arm64",
        using: :nounzip
    sha256 "1d60f7fd889c8e36c205a5486343793b46e58d2d8cca62d96226e1d3a9e0af67"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.18/libra-linux-amd64",
        using: :nounzip
    sha256 "e961c61fe13feb3cc76a81c749b451db7c796a3417665f257c40243d81bba6f8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.18/libra-linux-arm64",
        using: :nounzip
    sha256 "8a36031c435899a574e254c44d9c08f82616c136f237aa4974f7f2c89fc40640"
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
