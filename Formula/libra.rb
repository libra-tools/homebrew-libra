class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.107"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.107/libra-darwin-arm64",
        using: :nounzip
    sha256 "68ced35bf04a657678e0b69a87cfab70f8b7d1ef752b607932202471ad60d2cd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.107/libra-linux-amd64",
        using: :nounzip
    sha256 "3fcc288e2b4dc1776d1383abcf527aff6882ff4a4bf73c3694592f25dc5a56df"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.107/libra-linux-arm64",
        using: :nounzip
    sha256 "7b38b8a6481ae71c2e4891b22ad78806e9646b76c2081366ccfbde063269fbfe"
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
