class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.11"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.11/libra-darwin-arm64",
        using: :nounzip
    sha256 "f4b965ddf6dfe017a253c17e36bab9f6adf37e121a83a055697a057b44a9213b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.11/libra-linux-amd64",
        using: :nounzip
    sha256 "4832ddfb16cdd2e087ba08333dae3ac4069b6da0156a1455fb9c48855a20d2bf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.11/libra-linux-arm64",
        using: :nounzip
    sha256 "d3f9bd4cf86c0580c407c5c66510606690061b6280fa2100cf9c8146667f9dd3"
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
