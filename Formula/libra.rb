class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.14"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.14/libra-darwin-arm64",
        using: :nounzip
    sha256 "9f0dd9fe0a0627e6a27e3c5fc1b7d79ded481f20b3b2cf273cfe1bb778a875e1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.14/libra-linux-amd64",
        using: :nounzip
    sha256 "391bbbe2683a6db81db2966c183b7e02dce5148e3043262b6dde3c809c7add0c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.14/libra-linux-arm64",
        using: :nounzip
    sha256 "2a6b469f64f5ae4c6d626af8ea6a0d00d2981b3381db7c92eee8dcb702e0ee84"
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
