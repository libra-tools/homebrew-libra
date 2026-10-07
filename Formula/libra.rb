class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.32"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.32/libra-darwin-arm64",
        using: :nounzip
    sha256 "f6f31563c888ce1e2637fc4b11a40d3c4cf08befb69ff583a904a3125cf0f2eb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.32/libra-linux-amd64",
        using: :nounzip
    sha256 "4697dc656a1c845389b8ec9095c984a41f0a46021f7f0c6f658f54a7e74c7f35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.32/libra-linux-arm64",
        using: :nounzip
    sha256 "f664f71d6dcda23d5a2e04fb7230318eca44dae5871c109becf519444012a97b"
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
