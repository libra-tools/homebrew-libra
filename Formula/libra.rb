class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.33"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.33/libra-darwin-arm64",
        using: :nounzip
    sha256 "f67d22861872cf043d1952ec4aed2f42e666530cf7abd32ed83c407d10264a9a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.33/libra-linux-amd64",
        using: :nounzip
    sha256 "270b6b38b655f4eb54aa6d6e1e04fa9879228f15692542c62114304749df580e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.33/libra-linux-arm64",
        using: :nounzip
    sha256 "a63d6dea1620b5a542b8cc8d6ad5d90a8aba25a3ed78d1097f5f33b008d2cb6a"
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
