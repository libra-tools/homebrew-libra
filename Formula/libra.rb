class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.69"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.69/libra-darwin-arm64",
        using: :nounzip
    sha256 "138f20c182bb07fc5324f84f17c9d62c1f0628f837dc272e700f63ceb66cf1da"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.69/libra-linux-amd64",
        using: :nounzip
    sha256 "236b63fcf165be36b2f230b402626a765d49a0e8c4db874d75c154085c21bfdd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.69/libra-linux-arm64",
        using: :nounzip
    sha256 "f03c36db3cffde909a588d85ea38668a6a10950e58b8f28bc7b3f7612349080b"
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
