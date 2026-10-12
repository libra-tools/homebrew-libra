class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.46"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.46/libra-darwin-arm64",
        using: :nounzip
    sha256 "98b59410a7844faa4fbde0930bf8d5261bef9a22b312d9b88b39784e8c008449"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.46/libra-linux-amd64",
        using: :nounzip
    sha256 "6226617ba3621454d6b613cc6bd3340ec20e0d828bccb1200a9bf00c972a2102"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.46/libra-linux-arm64",
        using: :nounzip
    sha256 "b4c200b6c9bc7af7a67766aab8a7ecacbbda9b68a26d00f2cdbf789607e5b85b"
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
