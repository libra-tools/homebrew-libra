class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.72"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.72/libra-darwin-arm64",
        using: :nounzip
    sha256 "d7027320e0b286f89c6b666a26a54cc0ddce52eba9fcdd11c30ec3038c20c7e4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.72/libra-linux-amd64",
        using: :nounzip
    sha256 "a025a8050a1fa6e149cd0f2aca47109ae9d7d3a6add10a24e7701bfe7f96c372"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.72/libra-linux-arm64",
        using: :nounzip
    sha256 "bb0b692b95828a8d2dc9f9bb6fe529a74ac2d4c2990907b723fee83d23483796"
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
