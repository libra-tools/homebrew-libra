class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.13"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.13/libra-darwin-arm64",
        using: :nounzip
    sha256 "8e2cdf4ebf77ea110ae4541a9ffde82ddb195e7d45b28713f30fc6a7e2fd8ffb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.13/libra-linux-amd64",
        using: :nounzip
    sha256 "a5450a8169a114ad0a25b0ac480a88ee46ed763b123a8e838126a5ec93f26974"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.13/libra-linux-arm64",
        using: :nounzip
    sha256 "cf1b0c3c91ae770c25809528decab45328fd69304944c2c2e605f868d7b2e5c9"
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
