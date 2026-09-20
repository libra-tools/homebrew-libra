class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.27"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.27/libra-darwin-arm64",
        using: :nounzip
    sha256 "8fff489454f6e93b4d5ff3084346fcc0f98ee4741cee20f0a67b535b38590f4b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.27/libra-linux-amd64",
        using: :nounzip
    sha256 "49c8cc0270abcb15ba0b50735664af3379d80bc5fa88799e1af61da5276db021"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.27/libra-linux-arm64",
        using: :nounzip
    sha256 "d2b8ddbd34ba87c4745d855c36d62049080028cd363191aabec5491eff863f21"
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
