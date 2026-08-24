class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.25"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.25/libra-darwin-arm64",
        using: :nounzip
    sha256 "3c9969ad645a3f88d0ee4b5e27f8c9cb5476586c9bf2e99177cd27d276856253"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.25/libra-linux-amd64",
        using: :nounzip
    sha256 "823d4e7005a82ee4762ced30f85056fd174cafe3b8de5690918bbf0c96dcf4b3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.25/libra-linux-arm64",
        using: :nounzip
    sha256 "b18f42cbb3d520ac6f0cd6af9f52f2e2c3ebd0dd808213e518b5b9140979d7fe"
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
