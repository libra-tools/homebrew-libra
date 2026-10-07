class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.35"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.35/libra-darwin-arm64",
        using: :nounzip
    sha256 "bcf579da850a16c1619f839d6cb82199018c1724841eefaa5466b5741b1c0734"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.35/libra-linux-amd64",
        using: :nounzip
    sha256 "10bd2afd235e12651fcf986c13ac989616e51cda8071a76bc3c0fc2f4e690c94"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.35/libra-linux-arm64",
        using: :nounzip
    sha256 "019b79862b73856a11e3a8b3a3cf9c9d20b48d19ccd3fcebbaf267e12217a65e"
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
