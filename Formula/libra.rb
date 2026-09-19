class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.7/libra-darwin-arm64",
        using: :nounzip
    sha256 "363ab04868d63995d441dd9f295019e61732f631f716f7d2529a2cab9f004379"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.7/libra-linux-amd64",
        using: :nounzip
    sha256 "06c1e4730da8e67e445f07dc6f9e87e641978ce9fa0b30505389599a0ea753fa"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.7/libra-linux-arm64",
        using: :nounzip
    sha256 "af36b10fa68667f70c2ab8256c1a01cb0e46ca6b2a05d0b8de0cd9b1790d4464"
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
