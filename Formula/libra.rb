class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.52"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.52/libra-darwin-arm64",
        using: :nounzip
    sha256 "73f6c9948da7f80970e335303f46c47cfc78d28e52a616323cb3a620fb37881a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.52/libra-linux-amd64",
        using: :nounzip
    sha256 "930e8c31ef38f3ae1a42af919811a09cd64f88927787f210664739e41edbecb3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.52/libra-linux-arm64",
        using: :nounzip
    sha256 "bd1c0e60433314ab55d9f695dc4212b6eecab1ffde57f4bdb3066ca0c86a15e3"
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
