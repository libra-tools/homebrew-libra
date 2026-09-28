class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.28.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.28.0/libra-darwin-arm64",
        using: :nounzip
    sha256 "f94f27f616f85c4d31615b83288647844aa3be6fd909f1311c45045c0cd1b0b9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.28.0/libra-linux-amd64",
        using: :nounzip
    sha256 "51b7eb23bf43b75bb592b38be18aa1ac7fe3ec7dd040888c8604e8ce9ce1d16d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.28.0/libra-linux-arm64",
        using: :nounzip
    sha256 "474b9a821bd2decc891c3f97a309cce28a85fe29e1890e1a01d2b6372001296e"
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
