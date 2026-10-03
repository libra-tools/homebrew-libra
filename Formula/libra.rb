class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.27"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.27/libra-darwin-arm64",
        using: :nounzip
    sha256 "27bdd46aca791015a917e71588b2f2ded2ec91f7aa61be19b6e326158c3b46f0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.27/libra-linux-amd64",
        using: :nounzip
    sha256 "7ea834de8e226eb752c147034755d5ce82b642d9bb3d6544752a858701fd3a4c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.27/libra-linux-arm64",
        using: :nounzip
    sha256 "855cd1a69cc6aea2ac26a806d4597a295437ccb5db2e21507bbe952842db9285"
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
