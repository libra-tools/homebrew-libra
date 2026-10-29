class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.97"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.97/libra-darwin-arm64",
        using: :nounzip
    sha256 "bca1d5315ec638b58b640a77a590cb3dde47453100e2ed977c2fb3a446352480"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.97/libra-linux-amd64",
        using: :nounzip
    sha256 "3d38c4e8e06e43a3756d2d66f6f86369fd6c2b8ed68e4bb4338a54ba754a3e98"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.97/libra-linux-arm64",
        using: :nounzip
    sha256 "53fa806417fc796efc7010320a25b7df17634fa6ce6d383dbcefd2fd2783cdb7"
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
