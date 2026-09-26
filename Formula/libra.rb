class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.67"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.67/libra-darwin-arm64",
        using: :nounzip
    sha256 "1f97f6bdc13588f261e0eaebc75c6c71c1fb3ce8add3cc6648cbdf67d4dc73d7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.67/libra-linux-amd64",
        using: :nounzip
    sha256 "c9252c9037d6aa21c9765b9546e63ce94898e0eea8556cc9bc3ab53ddafdd2e7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.67/libra-linux-arm64",
        using: :nounzip
    sha256 "22269003b9718fdf5323d74d308b23493d13e8557651a211d5eca49ba5900e79"
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
