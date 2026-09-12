class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.19"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.19/libra-darwin-arm64",
        using: :nounzip
    sha256 "14d9d5896bab1aa85fcc89cded69200f1d23a7bd41500b68633b9b2c51d72dab"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.19/libra-linux-amd64",
        using: :nounzip
    sha256 "03447eb983178433425b5afffba351edae4044e7ded5b9e35c956dddb2bb68a6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.19/libra-linux-arm64",
        using: :nounzip
    sha256 "27fa0338d845a9dfda4101548b992248dac249d7dc7c024f45eedb3c74470d57"
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
