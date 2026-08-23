class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.9/libra-darwin-arm64",
        using: :nounzip
    sha256 "5de9150b6c7f81d6cf799dced5e0fd69c940ef881073057a8f52d8411fd149f1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.9/libra-linux-amd64",
        using: :nounzip
    sha256 "110da7d3b05012893d321161dd6e8f5215c9aabec5f8ced55b50d7b2e4067731"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.9/libra-linux-arm64",
        using: :nounzip
    sha256 "3fe4263f457db511d53909626a6a367a5b4417a404a51895daf25460a8424970"
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
