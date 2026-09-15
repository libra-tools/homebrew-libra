class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.32"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.32/libra-darwin-arm64",
        using: :nounzip
    sha256 "5bcf35d6e94b0e4cdbbb0b93990989cfb1e8eaf30379a5e87b5a36b700ca3ee4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.32/libra-linux-amd64",
        using: :nounzip
    sha256 "c0288233ecfaf9b47d41308e13f91677dfec5334e7e57d88962f349928dfab8a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.32/libra-linux-arm64",
        using: :nounzip
    sha256 "7876028328dbbb153fd1d2d48f9a9c9e47e46675aa91f7b592011fa63e0671be"
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
