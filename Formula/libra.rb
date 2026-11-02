class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.135"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.135/libra-darwin-arm64",
        using: :nounzip
    sha256 "88a0ca9bd42ca46a80994bd23be365ba5172ff27063f4fa241729ddf792a30e8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.135/libra-linux-amd64",
        using: :nounzip
    sha256 "2a39cf53305b9812d7ea29f31861fd741d3e292305634795734a8d77d0dc1e15"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.135/libra-linux-arm64",
        using: :nounzip
    sha256 "0fe7e146c4bd6cafd76489caf102f6f59e95fd612bd47b55abc648ca545aca2a"
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
