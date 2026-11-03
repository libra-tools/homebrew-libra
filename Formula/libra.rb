class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.144"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.144/libra-darwin-arm64",
        using: :nounzip
    sha256 "c2abb324678b91436496825ebfffad42537937661096887464fd3835ed88a345"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.144/libra-linux-amd64",
        using: :nounzip
    sha256 "a931ebf3dc3014182b1b228022a2694174abcdb5533a57169556fef2f1fe66af"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.144/libra-linux-arm64",
        using: :nounzip
    sha256 "27f7b1926d81b5ba0a10592cf0bce324972054577bedc2a55e0bfa1e9fbb0a61"
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
