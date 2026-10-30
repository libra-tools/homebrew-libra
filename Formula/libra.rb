class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.114"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.114/libra-darwin-arm64",
        using: :nounzip
    sha256 "cb27f35f6037495e77044620f9b0257253e923b09aea685d23062f1ca02b14a4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.114/libra-linux-amd64",
        using: :nounzip
    sha256 "bbe48315355b0734f1dc1e8b2e2009b159dd536d3294044a2f86aa653f9ca755"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.114/libra-linux-arm64",
        using: :nounzip
    sha256 "cc7ff1029b3200069030da75d3a7b414b57db3a98c7e596cc63c0b02df011611"
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
