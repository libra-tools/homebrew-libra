class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.149"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.149/libra-darwin-arm64",
        using: :nounzip
    sha256 "cb326049c074af5baea7a264483c0327fde15bbdc89b98c897dff167bc3ba056"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.149/libra-linux-amd64",
        using: :nounzip
    sha256 "3eebb78f2e829427890aec933f337b89080a6ffc940ec3deb6f717f8a4e8d467"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.149/libra-linux-arm64",
        using: :nounzip
    sha256 "35ad641b587bf3401ed54a30829dd61bf2deba4845b493ab6f86f4e01fb9fd67"
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
