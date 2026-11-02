class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.136"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.136/libra-darwin-arm64",
        using: :nounzip
    sha256 "2d2a630baa9525e62b1b6fe125a21119f815064e3f2dfa07d38fec2650dd3210"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.136/libra-linux-amd64",
        using: :nounzip
    sha256 "90021ea7ad4dccccf9f7d6deb98c9973a2b928069ba45e90062a5d1f9fffdd99"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.136/libra-linux-arm64",
        using: :nounzip
    sha256 "1b302fb612b022df0f16115fa769839c0e14efba3cd10df4177363add9ad97da"
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
