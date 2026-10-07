class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.33"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.33/libra-darwin-arm64",
        using: :nounzip
    sha256 "cc83ac166f58bd972adc4b1e2b22ea494e43343f67de746221a0131866f54afd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.33/libra-linux-amd64",
        using: :nounzip
    sha256 "3d662babdee58057c6e49933c34d3de6da91e0e63c5ed7d0d6296a0f031617d9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.33/libra-linux-arm64",
        using: :nounzip
    sha256 "7abeb5be51823b722bfb62aec1aa5b4ec85f98e466bfbd777d8e7050e63214cd"
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
