class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.34"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.34/libra-darwin-arm64",
        using: :nounzip
    sha256 "f273210088ba4eb451e1524eb579f44f07c556c359affcec5c8a6bb83207c7db"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.34/libra-linux-amd64",
        using: :nounzip
    sha256 "a61532ff1c449ebfa155e11453fcdeca7fcaef249f7ae742459245c17e329afa"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.34/libra-linux-arm64",
        using: :nounzip
    sha256 "f8d1768d8a8bdbfe70f76202afc1fab56bcadd7be1a2a30beea3bb851ccc52a1"
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
