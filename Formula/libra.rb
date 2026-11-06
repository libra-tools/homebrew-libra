class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.156"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.156/libra-darwin-arm64",
        using: :nounzip
    sha256 "0462f2c6fe22a6741ff61e0bae65eb1ae2f15219d83c5e171b3b88fd725bf7a6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.156/libra-linux-amd64",
        using: :nounzip
    sha256 "e49095da162f848e67bd7c568e894d0f20a79e3ebc1a55c0038968ef7d2fcecb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.156/libra-linux-arm64",
        using: :nounzip
    sha256 "6b02c6af8f5bef16fc355826cb4afbdbe285b570fd878bf171e6bb94a30b462d"
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
