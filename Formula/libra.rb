class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.36"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.36/libra-darwin-arm64",
        using: :nounzip
    sha256 "e6cfe221e52f1f17f22885d8c70625fc31604006f67dad21e742c12a28428d2c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.36/libra-linux-amd64",
        using: :nounzip
    sha256 "01bae8635e6c8b3e2865c3993cd52181681b9cc9484845865f15e6c901b96117"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.36/libra-linux-arm64",
        using: :nounzip
    sha256 "e892e998fc701ccc70b284fb1fa74bdd131c4d165873bb646dd4e6cc53caeefe"
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
