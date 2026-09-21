class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.40"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.40/libra-darwin-arm64",
        using: :nounzip
    sha256 "ac0e5e4de456e37704b5d3a47079dbbde1a947fd4f97e1aea8470e16ec4e1fd9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.40/libra-linux-amd64",
        using: :nounzip
    sha256 "3699ef716eb962e4828cf81ab12c0d777fdeac5a01372950058f7b6b52dd196a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.40/libra-linux-arm64",
        using: :nounzip
    sha256 "9068b5dff4c0cba4d9d0e98ce447a08352dd6ee4f5a9214a19c9c695d328acd2"
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
