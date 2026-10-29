class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.93"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.93/libra-darwin-arm64",
        using: :nounzip
    sha256 "09668495f87a75038e8320e04157a415c37284a90accb91fce2ca798dda5526b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.93/libra-linux-amd64",
        using: :nounzip
    sha256 "4713dd4dab62aa09abeb1dc9690e00462659a8d16610601db7ca652bcc90a486"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.93/libra-linux-arm64",
        using: :nounzip
    sha256 "add2ba8bbf8fd8df1dc5ea30e284db011aa99acc95663f7a3fe2afdb97df77c2"
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
