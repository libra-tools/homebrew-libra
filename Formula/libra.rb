class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.7/libra-darwin-arm64",
        using: :nounzip
    sha256 "5f1e84d3d9c76437e017e55e04c43f6576f7a7df4172d683da5f1132a137d34d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.7/libra-linux-amd64",
        using: :nounzip
    sha256 "540e2d23702c97a4d8a3bf5976cfd28d958a83015751921dce49645d84a5d221"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.7/libra-linux-arm64",
        using: :nounzip
    sha256 "49941e2dc3218c81a83d93c6708b70bcf8114a33a5f403f930af4d104babe807"
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
