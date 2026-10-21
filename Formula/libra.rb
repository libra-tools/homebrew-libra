class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.79"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.79/libra-darwin-arm64",
        using: :nounzip
    sha256 "b1e3ae1e51102c8714c892e7b6026630d86288f47c9570b17f900e78d8ac4b9a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.79/libra-linux-amd64",
        using: :nounzip
    sha256 "1620ef97424b8a80c14bf0495db97a1cc1fd4d32f98f1e1b5e15ddfab5690618"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.79/libra-linux-arm64",
        using: :nounzip
    sha256 "27025c74759e1c769ddd375c215216d41429fdeaf1e73feeceee147b7f8fd9a7"
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
