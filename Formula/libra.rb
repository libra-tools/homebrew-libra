class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.68"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.68/libra-darwin-arm64",
        using: :nounzip
    sha256 "8f39685cfc4b828ab78b0e762407d4998c276a90f44c63769a38e75226750295"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.68/libra-linux-amd64",
        using: :nounzip
    sha256 "cc0ca60f8b94d476de480ab2c189fa945064df3efcc9fa733f7945a483df9a83"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.68/libra-linux-arm64",
        using: :nounzip
    sha256 "3e0a00fd6ad2c571fc3e4bbdbba24a4f37d1729781a1a5da204dec05e1c56c6c"
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
