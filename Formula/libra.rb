class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.145"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.145/libra-darwin-arm64",
        using: :nounzip
    sha256 "5d03471cca4ead34f6ddda586c556857398aae3577f44182ad1dc2e23300b1d0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.145/libra-linux-amd64",
        using: :nounzip
    sha256 "14e67d5d3bb240a2c90da4a08480ce79eb1123973065e2a2c04cc5bd902f24c0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.145/libra-linux-arm64",
        using: :nounzip
    sha256 "e3dec89d13438e8b33eac2975494de7e3f8d209f322bae9aeb351b2a008cb8a2"
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
