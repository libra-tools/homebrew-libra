class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.105"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.105/libra-darwin-arm64",
        using: :nounzip
    sha256 "8fb01b05269a9a93b3f0368fc67726ce67bfd53dc735ff429057efed82c8f48e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.105/libra-linux-amd64",
        using: :nounzip
    sha256 "0340ed78254aa11e73679e507c6192188bc494b22e1c5295e7b4aaf9f0ebaa04"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.105/libra-linux-arm64",
        using: :nounzip
    sha256 "38b07327bf1dc5e8af3f18ed170c0399674dc04e77e86f665008e09acda78859"
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
