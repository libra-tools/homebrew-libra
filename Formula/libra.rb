class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.284"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.284/libra-darwin-arm64",
        using: :nounzip
    sha256 "6e51369f3378450224de24d8c88fb48107b7477b402c78848e979b88407102f4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.284/libra-linux-amd64",
        using: :nounzip
    sha256 "5934440b772b09bfd71ef624610fd597812b72275ce20daed390b9a2af66b3d1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.284/libra-linux-arm64",
        using: :nounzip
    sha256 "ac880eb176fd7e93f9e8fc79a8584659677a3208bc4bac5c48a897feab22d4b4"
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
