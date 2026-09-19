class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.6/libra-darwin-arm64",
        using: :nounzip
    sha256 "65be05c0089d765e775fdb275d9c71d84ffe54fcfce2d07d37108f745c328ae8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.6/libra-linux-amd64",
        using: :nounzip
    sha256 "cbeb0bfc157a5d084096e17d13304fcd393dc7b369f94d53cbe5364ae4a82a5b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.6/libra-linux-arm64",
        using: :nounzip
    sha256 "d8431dcb26f797960b71005f52e50f1591720083628dafa4367aa0e26cd21ca5"
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
