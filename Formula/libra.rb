class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.94"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.94/libra-darwin-arm64",
        using: :nounzip
    sha256 "7ca81377c84e9d3c02e60ebd8cbe93f362161fadb21b9e479a7398bd54173b06"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.94/libra-linux-amd64",
        using: :nounzip
    sha256 "9c03d0d17bf514b90b43d62b128a3e81dfcd2cb5830c5642409fcd6aa1a0e9be"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.94/libra-linux-arm64",
        using: :nounzip
    sha256 "d09a0eb8837166da6f50590bc4b86d217b73d0c9744daa302b5657a6fc977442"
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
