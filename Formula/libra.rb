class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.74"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.74/libra-darwin-arm64",
        using: :nounzip
    sha256 "ef95d53cc40709b5338c3c7e0255787e29beb50a8a3f11f5119ad2a8d4272f8e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.74/libra-linux-amd64",
        using: :nounzip
    sha256 "838ca617c67d3506267e47b7c3da506722f8a870f41ec948a9c80c635d494201"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.74/libra-linux-arm64",
        using: :nounzip
    sha256 "b09ce8d76a98395839dc1c148d132b3ce4f4866f910b56fe55424ae02f8a49f3"
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
