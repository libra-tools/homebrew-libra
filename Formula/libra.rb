class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.65"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.65/libra-darwin-arm64",
        using: :nounzip
    sha256 "a3e1b97bf6b6d36dfeb122f5c25c8487d0a8c6103f754238c59b4f44522b7d3c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.65/libra-linux-amd64",
        using: :nounzip
    sha256 "ba287edbe7b4e9aea27a72780640edd6ee8186d8fe9e772e6bf3b6542753b0f0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.65/libra-linux-arm64",
        using: :nounzip
    sha256 "d0b31d659419eb3b3d5e958f14d16b3d24982dfa408c68a44795d77849b46df9"
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
