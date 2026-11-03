class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.141"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.141/libra-darwin-arm64",
        using: :nounzip
    sha256 "60df61d51594b6cf637c223629763c5cdae686bb22496091a0bc54eb2b59b237"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.141/libra-linux-amd64",
        using: :nounzip
    sha256 "e8ca4624c6e8054ba1b1834ab68b945bf381f4764e4ba13d34e0b3b6afa5a9af"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.141/libra-linux-arm64",
        using: :nounzip
    sha256 "0bd60ed24c2f20cd03ee97c4ed1d7428420852dee3712f149b44276eb08eebe4"
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
