class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.251"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.251/libra-darwin-arm64",
        using: :nounzip
    sha256 "38b9741e6bc2047e3a6c0dffad42f54691c08ecec7bc00f8fbe66cc2a5e11862"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.251/libra-linux-amd64",
        using: :nounzip
    sha256 "07167ae54f08a7ab67b17a05b2b5a13fc09dc0a2b50a0247a89177e899c43a98"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.251/libra-linux-arm64",
        using: :nounzip
    sha256 "7c52185c5bb9d43039af4480d0e0693d8fc9f6c860b399eb58b3ffdbd517cb3c"
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
