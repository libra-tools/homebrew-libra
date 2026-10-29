class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.98"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.98/libra-darwin-arm64",
        using: :nounzip
    sha256 "df1bcbd799985ee581d1c6651d85b1e9d886f07717d9086a20dadb9b22948e0e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.98/libra-linux-amd64",
        using: :nounzip
    sha256 "c643283c7b2e16bd16da02b09c8fb9eddc839dc182e32ada582e2e0e33bcf665"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.98/libra-linux-arm64",
        using: :nounzip
    sha256 "36f899f9be72069b0d0c5ae7d71ce2abc8283b9d08dde5dad0fedfd68a4a3d4a"
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
