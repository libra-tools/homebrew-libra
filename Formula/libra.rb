class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.41"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.41/libra-darwin-arm64",
        using: :nounzip
    sha256 "e79f52930d869d13abf679ebf4aa74279a5ba21faff60e2546664dc187ac1eed"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.41/libra-linux-amd64",
        using: :nounzip
    sha256 "e65a0076d3ee280c850a1bffbde431ca520e30b7a460e46b2e8ecf58b2c5e694"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.41/libra-linux-arm64",
        using: :nounzip
    sha256 "7804474478b9ab39764550d13bbfeabeb43a4c6497740ca722cdaf054eaaf7e9"
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
