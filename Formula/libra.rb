class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.21"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.21/libra-darwin-arm64",
        using: :nounzip
    sha256 "b644991762dff989e175240f811afba83a9358e008b47ee4b34303da7408a7e9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.21/libra-linux-amd64",
        using: :nounzip
    sha256 "762fa997286a0e9d952a771fbf33596b86d4ac1b11f71d0c580368a778959348"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.21/libra-linux-arm64",
        using: :nounzip
    sha256 "9e2bdfca900f04d21dd54a0025f9bb972769b01dbaa206b5eaf7955fb6618bfa"
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
