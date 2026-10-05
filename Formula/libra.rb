class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.30"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.30/libra-darwin-arm64",
        using: :nounzip
    sha256 "caf961f8881f5d6b0ac13aaa145979a93723ea0d9b8843823918603e460b5afb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.30/libra-linux-amd64",
        using: :nounzip
    sha256 "c65f55332009970eebb6059f0f63580ef5c178ce23ce66b83678a8e673b711e1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.30/libra-linux-arm64",
        using: :nounzip
    sha256 "49da17802370d8f128d793f83d66d59d999863f631d19b6f7be9fb77de49bb7d"
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
