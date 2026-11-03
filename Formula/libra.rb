class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.139"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.139/libra-darwin-arm64",
        using: :nounzip
    sha256 "37c5a3610c81e5a68f4f037d9e49282d42089b9395542bd47f42a4e20f3e113f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.139/libra-linux-amd64",
        using: :nounzip
    sha256 "f5d3548fdf69e3cc395a27a41a0208879f8a9bf4ac8d89c9797d9c7ab591a49b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.139/libra-linux-arm64",
        using: :nounzip
    sha256 "0b6ae3d1461d60125d64c3129ccdf9706f204291fb444734fbc0fc53326470ae"
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
