class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.16"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.16/libra-darwin-arm64",
        using: :nounzip
    sha256 "079693df226f45b98a9ea68d0bdb9c7d466e5f9c6383de770c4a80bcf6bf5bef"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.16/libra-linux-amd64",
        using: :nounzip
    sha256 "fb2af8cd713e8f0d7b3b0f52a327567444bd719062a29bfbb434f065ae9adb75"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.16/libra-linux-arm64",
        using: :nounzip
    sha256 "41abac49e75f300277d179004264cd894d7bc2166c8accf75ab5158f89787834"
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
