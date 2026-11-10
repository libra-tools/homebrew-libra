class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.169"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.169/libra-darwin-arm64",
        using: :nounzip
    sha256 "c4502d252e2fc0312beb8f5d777c9dc244092ad3a5dae10f7d13d6c82b159308"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.169/libra-linux-amd64",
        using: :nounzip
    sha256 "5891c1474ff4ce38a98a1f398b3239912f25a9032306bb6950853a90a19947c3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.169/libra-linux-arm64",
        using: :nounzip
    sha256 "daa8ae0b2042666234f76498ef116bae6c343d5ef88f7067812cd4619ebf7a36"
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
