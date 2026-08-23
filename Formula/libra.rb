class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.6/libra-darwin-arm64",
        using: :nounzip
    sha256 "4713e332e00033186aabeb2f534cc9321ae49b6ca2577f5510a0e03aa8e8c042"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.6/libra-linux-amd64",
        using: :nounzip
    sha256 "5a065b14c07a9456778c575a91d1de0145cde452b8ed488c0a40852b898e79e8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.6/libra-linux-arm64",
        using: :nounzip
    sha256 "137ab0e53f0a20df39276d9252dc23ed98a9282426eec947d1b8f62732aa768f"
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
