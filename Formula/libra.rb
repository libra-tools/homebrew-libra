class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.3/libra-darwin-arm64",
        using: :nounzip
    sha256 "5376d6b38c467c9960f0089a87827700c3781090a2298d83568a35f231a25050"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.3/libra-linux-amd64",
        using: :nounzip
    sha256 "cc8737160533c37871adb22b3ced3d4b44315f9e9f9d01d5ef7e1b1918dab2a9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.3/libra-linux-arm64",
        using: :nounzip
    sha256 "e00d149dad3078dcbed9bb14c36ffc9b54529f3fb309ca2607a1e95c1890d513"
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
