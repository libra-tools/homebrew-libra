class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.133"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.133/libra-darwin-arm64",
        using: :nounzip
    sha256 "122207c77cf9cedd8d8d8841f137e13aa8b384abf1a4be5eeee9e84ddda3879c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.133/libra-linux-amd64",
        using: :nounzip
    sha256 "c927dcc07eaf729ac6ad296de2ec50283810a36fd54ad8da01aca9070c5a3850"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.133/libra-linux-arm64",
        using: :nounzip
    sha256 "96cafbfd42ebf1bede22ef6bfec1e2ded32ec71c5d2d79787c83510b23afb82c"
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
