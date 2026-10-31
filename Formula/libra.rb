class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.123"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.123/libra-darwin-arm64",
        using: :nounzip
    sha256 "8dc6795a12b2357687586f64ac5d6aae88f9704618ad67f29df109e2f02b3ca7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.123/libra-linux-amd64",
        using: :nounzip
    sha256 "5b171403f539a2b2a5925ed1e3061a4c7b177dcb42f4125d7112dc3a34cbcbfb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.123/libra-linux-arm64",
        using: :nounzip
    sha256 "e5f42d114630be58b8ccddc149874f832402992deb9ebfece92615cc41cbfb18"
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
