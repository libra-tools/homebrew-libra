class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.13"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.13/libra-darwin-arm64",
        using: :nounzip
    sha256 "6fe9157ddfacfea929a778f00cde8fccd141574941be9b4f7032ba5cc8766f4f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.13/libra-linux-amd64",
        using: :nounzip
    sha256 "c55a803d7c1f579e6fdb0b1aa869997918109c8b0db1a29e371b6f179df1e136"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.13/libra-linux-arm64",
        using: :nounzip
    sha256 "ddad889f3d82b1d19badc4d9965066940dabb942ab196308b954df54f6548d95"
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
