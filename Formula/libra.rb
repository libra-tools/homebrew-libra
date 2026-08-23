class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.5/libra-darwin-arm64",
        using: :nounzip
    sha256 "d39c09f5a30f0c494e0ad6a71b53ab368d1717c4c5308e4297be30b8785614b2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.5/libra-linux-amd64",
        using: :nounzip
    sha256 "6de7c8c03b5b99cc8c2e81ac93df15c34c7b1078a9ae6919b43a6dd648ce6ac7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.5/libra-linux-arm64",
        using: :nounzip
    sha256 "d1e00a9d214c47dee2ca3dcdac94b0db318bce9aafcd9c5a2d6bb2ef9eb63789"
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
