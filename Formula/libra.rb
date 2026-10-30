class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.117"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.117/libra-darwin-arm64",
        using: :nounzip
    sha256 "f2baeb05550afd469c1b80689cce3c4b4fc3fb1e01053c3308e807fa26b99df4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.117/libra-linux-amd64",
        using: :nounzip
    sha256 "5833382f3984b5f5207fa95a92ea725600d9d794c1293fc8bd6b61864d436657"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.117/libra-linux-arm64",
        using: :nounzip
    sha256 "f98091db017c0cb8a9288f499ae2dce7e9ff440a6947b13a341551941a94f956"
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
