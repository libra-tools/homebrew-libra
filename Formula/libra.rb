class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.43"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.43/libra-darwin-arm64",
        using: :nounzip
    sha256 "5c37d9e6b20e394302fd6866de09fa3f38599dacb8fe145ddc9d5a1f4c6ff2c1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.43/libra-linux-amd64",
        using: :nounzip
    sha256 "ac35e754453170e22415c3941a353b968b21e21419a9ad0a15d7014998bf1dce"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.43/libra-linux-arm64",
        using: :nounzip
    sha256 "c5c5c15834cc5c7f2fc33ebc5760a67be012a95fa0788347f1ca2b286ce69336"
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
