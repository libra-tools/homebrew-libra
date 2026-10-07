class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.31"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.31/libra-darwin-arm64",
        using: :nounzip
    sha256 "b2473b84d32eafd63898ece906e6baa3feac4c724ecfe6937878d29221d5171f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.31/libra-linux-amd64",
        using: :nounzip
    sha256 "a03de0f9f59f7037c2650f8aa794b4300913fc3ad72dfa90d1ba37c5cdf12c16"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.31/libra-linux-arm64",
        using: :nounzip
    sha256 "7114f28f6df854d8ef7e7851e3daf8cbdf36718dc6e428a808036542e5cf3a5f"
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
