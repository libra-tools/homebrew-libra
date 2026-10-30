class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.112"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.112/libra-darwin-arm64",
        using: :nounzip
    sha256 "c0aac63f07f122b8e98637214335da59b494b0cc2b42e91e71abc5fe53d49bdb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.112/libra-linux-amd64",
        using: :nounzip
    sha256 "03d2a2753439238a0e72079e83b648398c3b8c5c59b1e2563172304f39ccdd12"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.112/libra-linux-arm64",
        using: :nounzip
    sha256 "9793bdd125b469f4d48db018590dd4f0bd5fca3eb21362faf096a06f69f35070"
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
