class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.90"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.90/libra-darwin-arm64",
        using: :nounzip
    sha256 "9d3d177c593f690696442c7794a8cfd5de67bf1e07ac101c8591206b50b47d74"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.90/libra-linux-amd64",
        using: :nounzip
    sha256 "dbe2355483f509cdfa6d44d2c5d22f3321f2eb45179fe15ecdd9df7832f27c90"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.90/libra-linux-arm64",
        using: :nounzip
    sha256 "ce663b6db0bf939cb07e7986a3737f5311aca8f7d01cf97c420990395563a818"
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
