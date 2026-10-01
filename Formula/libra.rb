class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.9/libra-darwin-arm64",
        using: :nounzip
    sha256 "bfdb3afab6bedabcacacfdfeb480d4677f2861a93e6ff3256a69b0ae7f658b82"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.9/libra-linux-amd64",
        using: :nounzip
    sha256 "fdd8269450a9b8a0fc8a027b8c61624eb7a0eb3590e708c6d113e7d7991ae70d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.9/libra-linux-arm64",
        using: :nounzip
    sha256 "4d03f742fc021390e0b03b24865900ee88954f32c8066386d1552d2f7d6b44f3"
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
