class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.40"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.40/libra-darwin-arm64",
        using: :nounzip
    sha256 "91e2547dca28f8a13808ce4780392c6bf7ebc4b406d978d1071c04f1add904a9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.40/libra-linux-amd64",
        using: :nounzip
    sha256 "18f2ba9901b9b92c2ab03ca623f107e82f73cf6468e1d95828edfa8dc2fea791"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.40/libra-linux-arm64",
        using: :nounzip
    sha256 "9de35370beb028b99fe0693e66351521d846d6520af3548faa90c841146a671b"
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
