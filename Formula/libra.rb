class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.11"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.11/libra-darwin-arm64",
        using: :nounzip
    sha256 "6ebf294d1d0c690f26874af0803698b28119331067f15b1b61e0c9ba99bf1d4f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.11/libra-linux-amd64",
        using: :nounzip
    sha256 "3d49fa8b84bde7728683020c0ef23d9f0b5a1a00f99ff14e4390ac962da7625a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.11/libra-linux-arm64",
        using: :nounzip
    sha256 "6ba75904d3a238aaf3b4f19a6c2dd2bcbdae07d4132430f06e8bab4703568ba3"
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
