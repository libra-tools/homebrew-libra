class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.18"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.18/libra-darwin-arm64",
        using: :nounzip
    sha256 "47c04c401af79c2e5eed77e8a5265bc09b3a3233ff46c672839ade8bc333c866"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.18/libra-linux-amd64",
        using: :nounzip
    sha256 "c702c3ab98737d8b44476fd168a0bdf014d9809ea159b7ac0fb2c1ee85070ff3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.18/libra-linux-arm64",
        using: :nounzip
    sha256 "aef54790078070a9fc3b57be7d2ec4ce11109a07d127bef603bd065682ccef30"
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
