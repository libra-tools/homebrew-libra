class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.44"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.44/libra-darwin-arm64",
        using: :nounzip
    sha256 "e73036691e272be6101ff3f841ada53ad6c17596d8b7e5ce18135ef847eaf36d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.44/libra-linux-amd64",
        using: :nounzip
    sha256 "cc18776c691190f1fea9a504dd01af7a964f633c3c08324ebaf2b22eb156dd79"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.44/libra-linux-arm64",
        using: :nounzip
    sha256 "ca232c53af6b585681c290b28f6c09dd330afbfe2075351dc84b875ac3c15df1"
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
