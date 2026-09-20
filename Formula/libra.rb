class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.30"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.30/libra-darwin-arm64",
        using: :nounzip
    sha256 "89ebaf7585f36e273577abd24237677a8ddf4bd7980c40d652605367f0cb4c55"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.30/libra-linux-amd64",
        using: :nounzip
    sha256 "a171efa3e99a575e0872e584f79487f56182af227ea92bc3c72b29a8600944a1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.30/libra-linux-arm64",
        using: :nounzip
    sha256 "f6453324f939c4247a180027129bc05e06d96fa81b9506ca10d57fa86e1db09e"
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
