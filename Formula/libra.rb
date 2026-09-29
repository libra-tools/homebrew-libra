class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.5/libra-darwin-arm64",
        using: :nounzip
    sha256 "37422721929092186ebbd5bdb6b296aa4b36e6207e2f1f8e791afd096aab201f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.5/libra-linux-amd64",
        using: :nounzip
    sha256 "9b2944c76b10d676b163463e9f9d92fce010dd6eb8ae9e69548048f6cd9818ff"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.5/libra-linux-arm64",
        using: :nounzip
    sha256 "e27ac0a207d03e50d1708a99c4acd110ee5b5d5241054dd68e21791bfb4982a4"
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
