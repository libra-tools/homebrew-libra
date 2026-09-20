class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.34"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.34/libra-darwin-arm64",
        using: :nounzip
    sha256 "d766d72c4d225aeae07d781b9d4962c87052fe20cf0182edec3ea357c1c19c50"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.34/libra-linux-amd64",
        using: :nounzip
    sha256 "79c35a8a44bd74f8d38d049ecda310003db9a3924ee4d23cda6e5a91b38adccb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.34/libra-linux-arm64",
        using: :nounzip
    sha256 "a1e20025ea239e01d66a72a89fa2384b9637619ac5148a97cf90b8842fdbd170"
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
