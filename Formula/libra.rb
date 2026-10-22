class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.86"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.86/libra-darwin-arm64",
        using: :nounzip
    sha256 "bcfaaba6dccae3e5d4bd232cfe2ad7139019d91d8a16d1c7c92b7794ee5ab06c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.86/libra-linux-amd64",
        using: :nounzip
    sha256 "a384ddeec47c15cb8a13c8b51a6eb2a8d9f25c0e97fcaf58830e4b8208a49df5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.86/libra-linux-arm64",
        using: :nounzip
    sha256 "eaaa2a9d81c98b44043c5a5a089d708a381dcefca3d5d17da3d564dbcd0b7e76"
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
