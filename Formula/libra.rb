class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.58"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.58/libra-darwin-arm64",
        using: :nounzip
    sha256 "0ccddfcdf50c78c385040209201e50279e7ef9208529d948c2aca645f62e4677"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.58/libra-linux-amd64",
        using: :nounzip
    sha256 "933a6ceea5a0f0b9aab61ec754a31f069ab4538e628206c9a6bee171684a6d33"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.58/libra-linux-arm64",
        using: :nounzip
    sha256 "fe4bc1bb48348584991494d94f1fc95caf3df9e02b9cde3c84da8e06b52be119"
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
