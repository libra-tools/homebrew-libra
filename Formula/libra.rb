class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.157"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.157/libra-darwin-arm64",
        using: :nounzip
    sha256 "18c2bd97e0aa8788b41ccd8e5e48da94a792c0f4ba37ee22bcacd68300dcedc1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.157/libra-linux-amd64",
        using: :nounzip
    sha256 "d3c32c7b7e3c23931892c85e0bd2ab6c708804af6c1a07dc8ecabad4327eeec9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.157/libra-linux-arm64",
        using: :nounzip
    sha256 "da729d959693d6f405765277ace37b8eecf84857092e33c582b4597e85651852"
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
