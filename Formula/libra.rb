class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.4/libra-darwin-arm64",
        using: :nounzip
    sha256 "8d7304e905be2c8ad762cfc0aa9da0c41a9ff92258453ec1fe2f78e9949effa8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.4/libra-linux-amd64",
        using: :nounzip
    sha256 "b7a3e77a7078d8b902f02a37115237f6af32cae971082cb1b2e20367618d374b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.4/libra-linux-arm64",
        using: :nounzip
    sha256 "cafa242b3bea91c29a84a1d0d80d5a7593ff5267ed5486a1cb5c1eb2068bec2b"
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
