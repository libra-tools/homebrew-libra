class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.13"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.13/libra-darwin-arm64",
        using: :nounzip
    sha256 "22ca06799aa55188a1faf68b2f64ea4cef1f6d1a6272f4c45523355fecdab8f6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.13/libra-linux-amd64",
        using: :nounzip
    sha256 "01b4e8cb1d674aeb482b0846f9ecd74251ccd40320950c47ad6891536253542f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.13/libra-linux-arm64",
        using: :nounzip
    sha256 "05e62c48636c57c86ffe83c8d3d9ecf6061a5f7ab0c9363e23f259fae25bfd9b"
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
