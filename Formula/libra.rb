class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.34"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.34/libra-darwin-arm64",
        using: :nounzip
    sha256 "9909e55cdf6054ade39866a02358a182529c7fa904e92ac586606321057d7458"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.34/libra-linux-amd64",
        using: :nounzip
    sha256 "755265d0910d5dc8ebc9eef3b7c157aa771f520c0ac900718cc05a3c7b7dcb59"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.34/libra-linux-arm64",
        using: :nounzip
    sha256 "cf5123d3594af0cdc9ecaeacdae7b23cdcdfaf333fb03975c42a0ad9db3a847e"
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
