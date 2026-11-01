class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.128"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.128/libra-darwin-arm64",
        using: :nounzip
    sha256 "be95688b2c9e0b27a8993f4b30b4f3d9c96843cd9637bc1aa7efe4b86bc6dca5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.128/libra-linux-amd64",
        using: :nounzip
    sha256 "75996d7c9aee609decbad9aa2cb32f4afe9a4d2b91545e1188882e76ac6d7bf7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.128/libra-linux-arm64",
        using: :nounzip
    sha256 "f1f7ada6cf6f3af5bacba680fef57c4b398dd3cf5c28bb6e456879508d964a64"
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
