class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.16"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.16/libra-darwin-arm64",
        using: :nounzip
    sha256 "702b15fc8776e63f0f3b121fc507bd403535686c347da7abc585742ebfebae8e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.16/libra-linux-amd64",
        using: :nounzip
    sha256 "9e66267f8026c256dacc702573cf54aea1ba96134034bce09fca03f333c6ca88"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.16/libra-linux-arm64",
        using: :nounzip
    sha256 "f05b6729c98947cca73dbcc273e5f13b905a3bfd01512ca6265ec923cb3366bf"
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
