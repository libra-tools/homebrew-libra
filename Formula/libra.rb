class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.26.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.26.0/libra-darwin-arm64",
        using: :nounzip
    sha256 "40ad3b3dfe7d2a2ade67c0bd6efbccae88bff4d56594113b4f7eb55dc95dc297"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.26.0/libra-linux-amd64",
        using: :nounzip
    sha256 "b2bc263f8458d441fd12324435d48714345efc27b3512b6aeb9870b1cece90b0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.26.0/libra-linux-arm64",
        using: :nounzip
    sha256 "59d0a3bc81b782a78314d3c5cdde8ce4ac6e83b770caa1cef271a5f814b4b3f9"
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
