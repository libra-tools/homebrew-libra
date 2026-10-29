class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.92"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.92/libra-darwin-arm64",
        using: :nounzip
    sha256 "89751799e30dcaa2b8bf53172f6f6ed3173a840d8719ec47bb75149985d6105b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.92/libra-linux-amd64",
        using: :nounzip
    sha256 "712cb0af8f1c0d7d551bb8020b81e3752c4e4159a42fb119516d1fcf4c375ca1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.92/libra-linux-arm64",
        using: :nounzip
    sha256 "93063486aefb45042ea8ae4f539f69f9e10f0f9349a675b00715af2830a661f5"
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
