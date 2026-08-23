class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.3/libra-darwin-arm64",
        using: :nounzip
    sha256 "be2cd3c665841a0908eb55e2de8546b34b0f057b0ce469d6f0224255385847e1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.3/libra-linux-amd64",
        using: :nounzip
    sha256 "7c5970d64d7df3a27b91b49e9028cd51193260261696f2224c9bdfabd2fb6319"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.3/libra-linux-arm64",
        using: :nounzip
    sha256 "5be56e871d9853b8ff2789e41d9f8ffb6cf94012fe3bba423d67a231715f4d32"
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
