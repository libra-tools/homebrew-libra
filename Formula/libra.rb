class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.77"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.77/libra-darwin-arm64",
        using: :nounzip
    sha256 "494242b685bb0dad7301757c645123c9ddc526b931fdcba409c799510c022b39"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.77/libra-linux-amd64",
        using: :nounzip
    sha256 "dbb7f53928a6bfdd13332913a37160e23f908d816a267cf1698bc5a63ee7ec8f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.77/libra-linux-arm64",
        using: :nounzip
    sha256 "acbe45bce5e72a64345c661c27324aa5e1a707a151ff3c68a655d03047f53fa5"
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
