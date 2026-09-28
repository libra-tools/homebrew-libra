class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.29.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.29.0/libra-darwin-arm64",
        using: :nounzip
    sha256 "c65a8d64873837b11f06c9bb55f169542ae6ce611f33ab14cd421ed1ed15459f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.29.0/libra-linux-amd64",
        using: :nounzip
    sha256 "64db18f434a1a8bbc10a6b9aaeb48c550643f7a5d4b5d0895bbc0628e8b22b1d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.29.0/libra-linux-arm64",
        using: :nounzip
    sha256 "75ba83d562b238c041fbba243329084201626079dcec43a7e9ea55f124fbe948"
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
