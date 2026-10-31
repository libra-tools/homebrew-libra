class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.124"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.124/libra-darwin-arm64",
        using: :nounzip
    sha256 "20fee0821799e028e72b2d19b99a340d2e081d538d17cf401bc24cac588ea7ea"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.124/libra-linux-amd64",
        using: :nounzip
    sha256 "f25700dade82f678c6d28d899c033fd4d5b3d197f8f3499ce80be41776a07268"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.124/libra-linux-arm64",
        using: :nounzip
    sha256 "6ee622dc4304c90336c36c05cfc27ecac4ac1373604c0fbbb71ec50d5798307b"
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
