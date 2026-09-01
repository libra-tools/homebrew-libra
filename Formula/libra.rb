class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.8/libra-darwin-arm64",
        using: :nounzip
    sha256 "3ba049e8320f266356e9b586ab87bf5d5a9fbc11983d062e79e6ba7b0f85bf68"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.8/libra-linux-amd64",
        using: :nounzip
    sha256 "5c0b788230116ec658db1350a35dd51a71945d3af30b180d27fd7c7c9b58a3c9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.8/libra-linux-arm64",
        using: :nounzip
    sha256 "6e6cfee96d33444b66f1796eaab7df1e40be52e8935cdd6c9e385643f743c78f"
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
