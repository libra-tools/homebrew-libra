class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.43"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.43/libra-darwin-arm64",
        using: :nounzip
    sha256 "d200d877ab1f877d73bfab756c48e986d66271a11f02695a1b7ccc9291bc564f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.43/libra-linux-amd64",
        using: :nounzip
    sha256 "2e9af5314837ea3f98e5a8ad45956e0bf293b443f7c6e62ca87c8b5e570b796a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.43/libra-linux-arm64",
        using: :nounzip
    sha256 "c5866197d8750249b4d06cceb69558b5d834852a525d2e3995b57b3ee2412984"
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
