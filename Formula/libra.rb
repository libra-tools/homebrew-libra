class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.12"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.12/libra-darwin-arm64",
        using: :nounzip
    sha256 "20e6551bcf59b179a1ecf4de19cc90ab34b82c8b844e5e2f6c9b4963e9e63a28"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.12/libra-linux-amd64",
        using: :nounzip
    sha256 "415896c27d5bffd6b01f5ee935acc02c9ffff38959479e9bc5cc351da47cf57b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.12/libra-linux-arm64",
        using: :nounzip
    sha256 "eacd29c6de93dd68cd850fe8426a9fd7ec71fbb2ba537b2fb354f79066e120d8"
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
