class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.96"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.96/libra-darwin-arm64",
        using: :nounzip
    sha256 "0c8a493e4b40e0eca85371e40778b6f0e4d739780f115884a13413629a0d848a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.96/libra-linux-amd64",
        using: :nounzip
    sha256 "562fe619ee807db5c5ff7fd2500dcbbbfb0ed972a86bf4b3b7b6867b94a4b632"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.96/libra-linux-arm64",
        using: :nounzip
    sha256 "b61818c7a94a8dd87e6850af433d04fac167f972b685bae45d88168c612b423e"
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
