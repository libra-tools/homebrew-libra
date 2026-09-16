class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.45"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.45/libra-darwin-arm64",
        using: :nounzip
    sha256 "d9edf33043ec4b9b77add728c93d3db7988cd5147b8cee58924140f5afee6d81"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.45/libra-linux-amd64",
        using: :nounzip
    sha256 "8f5e395f43d4a0b29ae768e458822b218f7f9044ccbf54599b1158ef95f19b50"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.45/libra-linux-arm64",
        using: :nounzip
    sha256 "fd3aa0dea50b4bf8825461d7a78ba1dc37ab23c61ef9f8227d28d6c89aa92c21"
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
