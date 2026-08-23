class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.12"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.12/libra-darwin-arm64",
        using: :nounzip
    sha256 "9e7f4bed5b94d3c87615b55d47a9dc22ae151ada9bd8d083aef41209bdbcf568"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.12/libra-linux-amd64",
        using: :nounzip
    sha256 "6fc6b1a0b836745a671ee5ec7f7c474ef6ead6802e59a1ed47109d9ba31d611a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.12/libra-linux-arm64",
        using: :nounzip
    sha256 "2e5c5b54fdcd03736d971189e31fa3d34e26add3672554f9bbd2e8048d72af6f"
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
