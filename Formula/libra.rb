class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.31"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.31/libra-darwin-arm64",
        using: :nounzip
    sha256 "51b3423f92701980a8cdbc5125d75aeea71649c444161d49c574d996926dfd0c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.31/libra-linux-amd64",
        using: :nounzip
    sha256 "0226fc54459745e2629f8fd030865e5c47dc4eeed686eeb8faebd83895718398"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.31/libra-linux-arm64",
        using: :nounzip
    sha256 "499bd879a7eadf1e88f3f2cc5e3c4e26446b277bce2effb8d405a26c4013aac9"
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
