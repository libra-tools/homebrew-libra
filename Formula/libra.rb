class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.13"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.13/libra-darwin-arm64",
        using: :nounzip
    sha256 "adf23616201601ab80166ad8cade8a68acc50e8f57c968e75b5faaf77562a44c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.13/libra-linux-amd64",
        using: :nounzip
    sha256 "bc67ce85c177e752c6c7c2dc1ae1f14c4b9d17859cf6b893185b14f8e084e6fd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.13/libra-linux-arm64",
        using: :nounzip
    sha256 "c80e476cca7b6d6243c62454d183969b2bb4ec82608e07cd03f87ec783991e00"
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
