class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.27"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.27/libra-darwin-arm64",
        using: :nounzip
    sha256 "3384c32ede7e7c94eafc50f1c9e0cf4d75d61ee43339e67fcd03ca619882ef0b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.27/libra-linux-amd64",
        using: :nounzip
    sha256 "8306160c64adeb9b1ed4ee3b6bd00b69c13f2f7abed807abf54fda4b97493a4c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.27/libra-linux-arm64",
        using: :nounzip
    sha256 "600084fc3f400575b3c71ff39ea05e4b4fe1acdfc5d674460e61a5897ff8f938"
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
