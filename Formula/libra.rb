class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.253"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.253/libra-darwin-arm64",
        using: :nounzip
    sha256 "e25420754f719cfc5a54d9dbfd6ea7c6d4df7c386959d0171ebade5bb498328e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.253/libra-linux-amd64",
        using: :nounzip
    sha256 "92479cf7231f4d314ac62c227740d9ccfe623cbc79ac1b66b50c4779422d7b0b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.253/libra-linux-arm64",
        using: :nounzip
    sha256 "bff696734d3a468d2ebdd7ed08aa88acd9bf8141674a3e388b46ad8aa3c52282"
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
