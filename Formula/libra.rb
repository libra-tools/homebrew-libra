class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.206"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.206/libra-darwin-arm64",
        using: :nounzip
    sha256 "03ef6f403b8ddcc321b7ae3177df6ce2fb3ecc27aa9c1cba11f997f247d04903"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.206/libra-linux-amd64",
        using: :nounzip
    sha256 "ce77786f715bafe464b75d6a0ab6d9aa6e983e75dcd4181ca3de02169f2672f4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.206/libra-linux-arm64",
        using: :nounzip
    sha256 "7e2be68b96be553bd6bde354f9c59392c5c91fc8034568873f30eae10c64aa90"
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
