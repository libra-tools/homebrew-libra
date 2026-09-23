class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.55"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.55/libra-darwin-arm64",
        using: :nounzip
    sha256 "db952d8a61b6ea693ea5519eae6902d2c46a44578b64971fd2cca2c0214e82e9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.55/libra-linux-amd64",
        using: :nounzip
    sha256 "fbbc8af4a8a2152790fad461731306c38fb69e8367f8127d230d8f7c6b85d8b2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.55/libra-linux-arm64",
        using: :nounzip
    sha256 "3c8465c9e06bed33ddd8946e73dc58832a6244128022b3182df117e3d7743fb6"
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
