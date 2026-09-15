class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.30"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.30/libra-darwin-arm64",
        using: :nounzip
    sha256 "41a92d5a8398aa6efa65f41c559d94faed5a84e6673abd5c162e6ae20329b7bc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.30/libra-linux-amd64",
        using: :nounzip
    sha256 "f0a069769e81412bc0fcc1e2dfb61614fa451dc85579d29d8650e14f96c0aa33"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.30/libra-linux-arm64",
        using: :nounzip
    sha256 "e8e718641bd2d22fb0fe94e9d49ac4f69ffb239532242c582a14f6d9de658a3e"
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
