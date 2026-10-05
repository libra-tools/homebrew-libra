class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.28"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.28/libra-darwin-arm64",
        using: :nounzip
    sha256 "a76af00a422eed8740391f570d739ade6e4c08f836bfffb0b776254fcfb754cf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.28/libra-linux-amd64",
        using: :nounzip
    sha256 "5eef79e23d10f994c7b6921a1036f4684b5f5ae6e3a3482813db98735e73b0ca"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.28/libra-linux-arm64",
        using: :nounzip
    sha256 "00556e1588145a2239a454f1e9b1077adec4829ce882b3f2e986ca99677b94c1"
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
