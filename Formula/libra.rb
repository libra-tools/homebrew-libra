class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.37"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.37/libra-darwin-arm64",
        using: :nounzip
    sha256 "b3e0971716dc74a9000c9ecb727d33f93cb8a35a86dfcb8158306c4ec729c084"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.37/libra-linux-amd64",
        using: :nounzip
    sha256 "ae53b932bf537795f1c60a0b8c0875b2a92ab6bf00d140c18932c6a2370adeff"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.37/libra-linux-arm64",
        using: :nounzip
    sha256 "520cab72b88713023548455c75591c930bb5d8d1c272ea6d275e03e22ce89eb8"
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
