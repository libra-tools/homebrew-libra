class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.91"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.91/libra-darwin-arm64",
        using: :nounzip
    sha256 "c473f0129208d05eab4d5c1342fb53d665ad41288f0a8b01cedb32ab93d97a9e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.91/libra-linux-amd64",
        using: :nounzip
    sha256 "c4773dfffa8ce0dd7cbe3ac8f58a431cb8356940760dcaf61a5b3da2579e8e69"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.91/libra-linux-arm64",
        using: :nounzip
    sha256 "06b362988f63e6a15536127d23cf78d9f3a93fe2263b100c8392c3b38282f09f"
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
