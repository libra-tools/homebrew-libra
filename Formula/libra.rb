class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.33"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.33/libra-darwin-arm64",
        using: :nounzip
    sha256 "1c44ac4c077b4f2ea2f6a82fe28fa44e05951e53a753c671482cc870350a8f55"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.33/libra-linux-amd64",
        using: :nounzip
    sha256 "2d068fc551a144c2247af14bb44609261e49b60fae8ed2663eda5dfedab27950"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.33/libra-linux-arm64",
        using: :nounzip
    sha256 "e5cc8dbd25d64574a59b0b34037ab89c7ccc9046392c1740ccb49de6f296fce0"
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
