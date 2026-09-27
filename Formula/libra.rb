class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.24.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.24.1/libra-darwin-arm64",
        using: :nounzip
    sha256 "14cd45b8ecb33d631c611c6cb4840173fec9f08a0bdcd1bd059430c2245f247d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.24.1/libra-linux-amd64",
        using: :nounzip
    sha256 "4a94c9b226843565a28e475faab3a9c3f340c370bba099bdc33b3c3cb5aa2fd7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.24.1/libra-linux-arm64",
        using: :nounzip
    sha256 "5443e37a96501b262c06382d291bd42b1121540c373fe806987f0f75a280fc36"
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
