class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.159"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.159/libra-darwin-arm64",
        using: :nounzip
    sha256 "7862f1c77bdd1ba60dd2bbdb0eeee429f4facbe54c1e06d51d27c589e22ec17b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.159/libra-linux-amd64",
        using: :nounzip
    sha256 "a09c2ae9169705e94e1ac46863673c94490039dbb6cad2868678d6ef9b9979ca"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.159/libra-linux-arm64",
        using: :nounzip
    sha256 "901ca4c47a372a294f07c55b48b5f77b04c5be244aa0e84561e350d225b909e8"
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
