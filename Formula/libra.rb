class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.2/libra-darwin-arm64",
        using: :nounzip
    sha256 "c046b9b1eb0afdc7a09a2b45226de27f59c74674b0b2ea4fbba23eb3e09f525b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.2/libra-linux-amd64",
        using: :nounzip
    sha256 "c2bfac76289ad118b8b451a4bc80ad5cb0316790edde165a4b27ea47280e0c88"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.2/libra-linux-arm64",
        using: :nounzip
    sha256 "c4ef8cfb17f63d31090e48081896d48c43b6d1487bf09ca6a0eaf127cf966181"
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
