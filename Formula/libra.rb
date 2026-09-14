class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.23"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.23/libra-darwin-arm64",
        using: :nounzip
    sha256 "cb93b23616ed2f1604a769720d31a181ea6d05f3b4ce371769a02d3440cd037f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.23/libra-linux-amd64",
        using: :nounzip
    sha256 "7c006d142a29bd6cf98cdefe1e53b95a9f1dba3adb4073fe1749f1dadf654c36"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.23/libra-linux-arm64",
        using: :nounzip
    sha256 "24c27fbad918505bc5ce6b632b2368ca72f5fdcf20b745d920d7712648aff56a"
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
