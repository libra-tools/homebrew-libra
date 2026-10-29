class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.95"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.95/libra-darwin-arm64",
        using: :nounzip
    sha256 "b7541d0febb521441dd36bb0a58fc1f03d73b39a893e5b93cc3971a53ab6fa5e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.95/libra-linux-amd64",
        using: :nounzip
    sha256 "0af1a8d051a09ec59f4488b45cd15c47d57710e196d567cc03792bfd70f8bcfa"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.95/libra-linux-arm64",
        using: :nounzip
    sha256 "2e8c582740cbb2ae42bf13969b95f10ecbf85353e262cbb2dc0b9bcd899088fb"
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
