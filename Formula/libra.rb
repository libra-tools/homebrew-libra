class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.152"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.152/libra-darwin-arm64",
        using: :nounzip
    sha256 "8908044e09a2ff54f6d3fe64b0ae4bea6188c6a86937775c6b9a5d2dfda57072"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.152/libra-linux-amd64",
        using: :nounzip
    sha256 "7a8c60d4f5528aee2fc202e196c1c8322f1e3a754116b05d0f46105d4e9b1641"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.152/libra-linux-arm64",
        using: :nounzip
    sha256 "51e98f206355df9111fd75610aaae5f49ab29e9220f2cc650f69ecfca15e980b"
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
