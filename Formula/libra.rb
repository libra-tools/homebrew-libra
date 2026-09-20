class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.14"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.14/libra-darwin-arm64",
        using: :nounzip
    sha256 "688a4906209e3fbd2fae5b78d7853fe8a7bc6d09fa046c8c24f677ce58695fdb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.14/libra-linux-amd64",
        using: :nounzip
    sha256 "6e6f688d7883c1d2d975a8a90c69c927771f70f431ca9651a38576381454d62c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.14/libra-linux-arm64",
        using: :nounzip
    sha256 "5b9ca727f68d042c5f3b54a84d3394ff082deb7cee6fc0960df25b62cf0d4070"
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
