class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.45"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.45/libra-darwin-arm64",
        using: :nounzip
    sha256 "1ffb193424b2e05fba03a51b9401d5b0971bd0f3b7a66ef021f7c09bc44ac0d1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.45/libra-linux-amd64",
        using: :nounzip
    sha256 "e6c386f09e17661b39af2ceb01b44b3f1fb3e3d02b9ae014490e2c54a2b9454d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.45/libra-linux-arm64",
        using: :nounzip
    sha256 "2406f8ea2bce0384caa9cbc9e18c74c6af5574d930db95c92f7806dd32e3120e"
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
