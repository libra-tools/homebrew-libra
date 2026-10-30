class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.111"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.111/libra-darwin-arm64",
        using: :nounzip
    sha256 "4b2358ce564cd1d33c9586e2e52b77f8c2f26fc0a159d3f9e7fc529a5e4d6c96"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.111/libra-linux-amd64",
        using: :nounzip
    sha256 "eb8d77cdc8bf96f9c148216e43b807b225a5f6230ba66375080f0c391675a7ef"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.111/libra-linux-arm64",
        using: :nounzip
    sha256 "6c2b8892b161ebc8dacf248b7f2e410305c90cea4eba95b490e7af142e162fc5"
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
