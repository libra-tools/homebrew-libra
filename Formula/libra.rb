class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.329"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.329/libra-darwin-arm64",
        using: :nounzip
    sha256 "b0d63dd273bf8e29376ac7437e759620559376d19be5426d869d87f589afdd2c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.329/libra-linux-amd64",
        using: :nounzip
    sha256 "2f0bfbcb698b0e46ae794afa7012f91ab24f215d4a6102c7339b113a5a0bfc82"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.329/libra-linux-arm64",
        using: :nounzip
    sha256 "14032cf33f17548dcd1fe3052ebfc300fea591d07c97978e35cba3ccb0b371f9"
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
