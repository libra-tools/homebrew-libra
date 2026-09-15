class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.41"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.41/libra-darwin-arm64",
        using: :nounzip
    sha256 "893631db125be54e81695343e2925106dea6a527bdb7ec0ee6089504ed116c18"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.41/libra-linux-amd64",
        using: :nounzip
    sha256 "a06600cdd0f872d0070104b45f9e15f08f2e26cea8f2eb51d712a9ebf24397f9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.41/libra-linux-arm64",
        using: :nounzip
    sha256 "2e2be9213f13d8dd22f8e3a8f549e515cf21b92b02380088c5436ea1333b0004"
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
