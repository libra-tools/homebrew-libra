class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.170"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.170/libra-darwin-arm64",
        using: :nounzip
    sha256 "bf52ca27f17312ca1d9e4468836ff03322c49f72938905f4c0d7ea615a0385e2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.170/libra-linux-amd64",
        using: :nounzip
    sha256 "f94a7531dca7da7d1054fbf4d30b3e3efe875b9ac79c574cb4b760fb2f98b168"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.170/libra-linux-arm64",
        using: :nounzip
    sha256 "29026c19f04879c551c3a321fff00e080003a1790106c02a42c2b1aa561f9615"
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
