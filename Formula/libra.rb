class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.148"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.148/libra-darwin-arm64",
        using: :nounzip
    sha256 "11789799060dbe4afe0a4ef8305431f4612eefacc4a33fb2ff81a3775a52bc59"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.148/libra-linux-amd64",
        using: :nounzip
    sha256 "edeead4277eccd44cdd28bf6cf51dc28d9caa012b937391bda8111bbbe205e85"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.148/libra-linux-arm64",
        using: :nounzip
    sha256 "c379b779a0933c6365af160c04ccf747ebbc7b2df9884e8da0f5bf3a50c8545f"
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
