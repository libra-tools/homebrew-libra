class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.104"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.104/libra-darwin-arm64",
        using: :nounzip
    sha256 "34897e9326f8ffd08ce1949583dd16ec7f5675ec6612d51e98688759a9a056f9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.104/libra-linux-amd64",
        using: :nounzip
    sha256 "e07553d578722b0a3defa1082d88d1f9855cb07298d513fed0be4eb1521bb1c7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.104/libra-linux-arm64",
        using: :nounzip
    sha256 "af0d51237fc0669e3e55c35dbd100e0922c86387f1c8e26ed4d27ae6a8d4292f"
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
