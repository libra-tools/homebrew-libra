class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.150"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.150/libra-darwin-arm64",
        using: :nounzip
    sha256 "0b8a47330663d8b85e8b77c9da507bce4d87dc0bad74d2f2cd799c6c61f57276"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.150/libra-linux-amd64",
        using: :nounzip
    sha256 "0dc6ebefa7628cc18cc99328e303f2fdd9b4124e9857f57e46ce651e468c86be"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.150/libra-linux-arm64",
        using: :nounzip
    sha256 "5b8900af808b65f47d5273aa03776d325bce9f90caaf0e5a2116c68d919d13fe"
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
