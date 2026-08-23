class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.8/libra-darwin-arm64",
        using: :nounzip
    sha256 "cbfa057dbdc32f7229c884d574de532cf268ce372e7544b07ed61282b5b831c1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.8/libra-linux-amd64",
        using: :nounzip
    sha256 "0c554a47825e0e3d6290a755228fca28360215784abe092b3b4b81f4c2f14a78"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.8/libra-linux-arm64",
        using: :nounzip
    sha256 "8449adb1c6b3f1ea65665cf19880460e88f6b36d0071a1346b1622fb22159509"
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
