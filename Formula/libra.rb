class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.76"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.76/libra-darwin-arm64",
        using: :nounzip
    sha256 "f2428e939e6d2669b693e8cbf1f35fde5bbcc897b4916a4fe2e0dcb2fe599591"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.76/libra-linux-amd64",
        using: :nounzip
    sha256 "972e29dbd094262164e97f4b033864a91efc2732b714cf57eb6e44b5fa112748"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.76/libra-linux-arm64",
        using: :nounzip
    sha256 "8241390dd20cc1d93724ccfbe020dc7e004946d7dad33a72feea90cc8a38cb46"
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
