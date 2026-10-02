class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.18"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.18/libra-darwin-arm64",
        using: :nounzip
    sha256 "612264b6aae3788d3bbd6e618f30c169fb227c3daf4f815fc0f8edc8f4ef4e7f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.18/libra-linux-amd64",
        using: :nounzip
    sha256 "243b7d31d7c88ff29def23e71f364be77376fc62ddd8d189041ed8241bf2786c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.18/libra-linux-arm64",
        using: :nounzip
    sha256 "715b192570fe63c9310d0a4b7961f4460a58fee974112c66ca1776b00f3f27c9"
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
