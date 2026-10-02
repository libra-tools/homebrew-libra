class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.20"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.20/libra-darwin-arm64",
        using: :nounzip
    sha256 "e9f4f6cdc10f5399c94db7fadb61b9c32cb21454caa0729c100743677d0759a3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.20/libra-linux-amd64",
        using: :nounzip
    sha256 "2cb942f150c86a51ce881dc3ea8dcfbe382c46406e580ee3c9b734b8b748be28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.20/libra-linux-arm64",
        using: :nounzip
    sha256 "78e0ea26949ebef00fe0e794503292320fb1d1bc3369952116c1d04fc1438249"
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
