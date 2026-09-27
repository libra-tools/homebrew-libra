class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.27.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.27.0/libra-darwin-arm64",
        using: :nounzip
    sha256 "8dca49b815375d588d662990bbddaa515796e7d63811455f1ca1b66e6da1197b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.27.0/libra-linux-amd64",
        using: :nounzip
    sha256 "94e2195bdfdd8a21f51c3ed31a707ac99ac50b592bbabc807d70de19849a60ac"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.27.0/libra-linux-arm64",
        using: :nounzip
    sha256 "726d212fcd83544c174e68819fec4d7f762fa0d06153b84dd562c31285a93448"
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
