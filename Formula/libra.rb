class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.28"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.28/libra-darwin-arm64",
        using: :nounzip
    sha256 "8ce9931997e41d7850be9332d9dcafde62e31c323672499837bb959a186e3493"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.28/libra-linux-amd64",
        using: :nounzip
    sha256 "fa2bea3cc8ea8ea6e05687c7d289eb9753ce7d81e3f17bcf1ca59671265ae202"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.28/libra-linux-arm64",
        using: :nounzip
    sha256 "18a1bd14b156d07b652f2b219bbc953fd6c8029875a6d8c33b224a9c4996e44d"
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
