class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.70"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.70/libra-darwin-arm64",
        using: :nounzip
    sha256 "555b60957281b35326efa92f2907f15c8cd3ddf00c68773ac93ca06b0e4736f2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.70/libra-linux-amd64",
        using: :nounzip
    sha256 "e3458746e4dc9c54dfee7d10fe7646227808ba4761817b2d8d31027eb6ac68a4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.70/libra-linux-arm64",
        using: :nounzip
    sha256 "3e3bef43254a03285331203295cbf9b691706059b461518f0c7b9b1adea03457"
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
