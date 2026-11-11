class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.173"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.173/libra-darwin-arm64",
        using: :nounzip
    sha256 "e955668e6d2eb0b12818bde0134c9629b2a4f42328fb504fdbfbc01f59ce31b0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.173/libra-linux-amd64",
        using: :nounzip
    sha256 "405ca1f5652a3659fac438a64ef092d83e88d1ed35207a2fbb4ec001418036d7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.173/libra-linux-arm64",
        using: :nounzip
    sha256 "6283933fcb5acaa41520bac6f8bbc9f88f5df3ddfd6f09c1a5dec5621abb6a9a"
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
