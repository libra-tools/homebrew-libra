class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.63"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.63/libra-darwin-arm64",
        using: :nounzip
    sha256 "278bb032407fb5557a125f4acfced7b07f90432024e011ac2ad080e1718b1872"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.63/libra-linux-amd64",
        using: :nounzip
    sha256 "ad71ae1a9d17f44cd379f3793e3ac817b077fd47bd9ed29d01aec6173c93f589"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.63/libra-linux-arm64",
        using: :nounzip
    sha256 "8f9f8f0749cc4b741a95d9ebdb6d04500662f1c323704142aff52c3d60cf467e"
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
