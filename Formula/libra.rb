class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.130"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.130/libra-darwin-arm64",
        using: :nounzip
    sha256 "46e97c1af01eb894395a6c185f3a7becc7005443ba538a20dd94f4631ecdd6f3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.130/libra-linux-amd64",
        using: :nounzip
    sha256 "e3068a65ee930886f39b96c778e4b03ecedb2c153367aed0ac51e8db19f5d7de"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.130/libra-linux-arm64",
        using: :nounzip
    sha256 "e15b9849d5fe00364d55ba965a8d531f972ed320e79abe05cb355718a9aa00cd"
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
