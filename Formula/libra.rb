class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.109"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.109/libra-darwin-arm64",
        using: :nounzip
    sha256 "a940753a6470d377104446ebada2e55d0ae6558aab1912015846306ee4f517f9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.109/libra-linux-amd64",
        using: :nounzip
    sha256 "3d89f9dfc0993d31919504f3c97360a19497e75665737e151a227c9d6e53c402"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.109/libra-linux-arm64",
        using: :nounzip
    sha256 "eec6e5a6188dda0c66c7e2eb9f1c2864be6eb680c35df52f11201d1acabce452"
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
