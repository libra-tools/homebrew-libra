class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.122"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.122/libra-darwin-arm64",
        using: :nounzip
    sha256 "3e426d727ced31d4c89884a7a977368db811d4cc4e23bc3d00e35a3d807c1c61"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.122/libra-linux-amd64",
        using: :nounzip
    sha256 "95ef0d65ec53fbe1ee09e31eeee89fa4832ef536ff883751bedc690b9899984b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.122/libra-linux-arm64",
        using: :nounzip
    sha256 "1214afb9ff7b3e09bb2dcd4a7a4d7780c8cf1aa5131eddd1dffc10ef83d37d25"
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
