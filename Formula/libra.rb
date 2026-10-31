class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.121"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.121/libra-darwin-arm64",
        using: :nounzip
    sha256 "18ec8adda4b25c10e32884a0a7fd12e1dcc1fe962f16150830f6423ad12b535e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.121/libra-linux-amd64",
        using: :nounzip
    sha256 "5c275161bf01d28ee7b03e03033332cbca94f109244b50fa6deb0d6ed6ac10ea"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.121/libra-linux-arm64",
        using: :nounzip
    sha256 "29d92038567e5d0b173701138707917c87ade30fe85c60bf4894e8beb6ac847e"
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
