class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.160"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.160/libra-darwin-arm64",
        using: :nounzip
    sha256 "b52120236dde3a96059e658051ce37d2f5d4ba7e339094db3fe7534d8a612a99"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.160/libra-linux-amd64",
        using: :nounzip
    sha256 "1cbe4e555b922952bcfc58c61971baf8dc4c060d29a7dc6ab47498abb8453d58"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.160/libra-linux-arm64",
        using: :nounzip
    sha256 "ebd3cd7c51c2e4655dc25e2eff793053e93d0e25b14541ea8e9c354e071e30d7"
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
