class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.23"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.23/libra-darwin-arm64",
        using: :nounzip
    sha256 "0526447d71460b3f92b2080ab03f1d91e98d5835e856735ebdcd02cda5923fae"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.23/libra-linux-amd64",
        using: :nounzip
    sha256 "04cb8ebdc5391bad9a5f20f4e6c0af510e46b325af86a244505158d9735a29e0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.23/libra-linux-arm64",
        using: :nounzip
    sha256 "5d1e98b8fb17129417a1541fc59dcd31f66ac79f795dfe171efbe376518cdb6f"
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
