class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.44"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.44/libra-darwin-arm64",
        using: :nounzip
    sha256 "266ec8357c8d44fc41e8d3a82df357b18c7a3b354cbb3762da1798b90bd9c703"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.44/libra-linux-amd64",
        using: :nounzip
    sha256 "b9dab8bd518dfb32a58502efa90ee0830ef05ca545cd513dd76efdb8a12d1e15"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.44/libra-linux-arm64",
        using: :nounzip
    sha256 "4a35a58de48525727ff31aa50845ff237c71a980138e946fa18c210a9f11daf2"
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
