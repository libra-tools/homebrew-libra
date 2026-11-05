class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.155"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.155/libra-darwin-arm64",
        using: :nounzip
    sha256 "a690990710f5204b03407f1eb93bb0042809b44b63669c8a6aa7aced2246bce8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.155/libra-linux-amd64",
        using: :nounzip
    sha256 "d08912962fb5438b39bb23f55a3ea773341620c5bf3a8066289bda35287a8b89"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.155/libra-linux-arm64",
        using: :nounzip
    sha256 "55afbbe975aa765cc6c8ba796088673a3cf70fb366b72f6ce11a4dcc779e70e1"
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
