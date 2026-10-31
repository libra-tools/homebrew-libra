class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.126"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.126/libra-darwin-arm64",
        using: :nounzip
    sha256 "c667b6846ed633fa00b3af9b17fec0af0fd907bb27ab0e86f290624011f3359b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.126/libra-linux-amd64",
        using: :nounzip
    sha256 "bee10cfc8ce393f9abd62469f87423e0e5b5e515632f8fb01bc24af81f3aa971"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.126/libra-linux-arm64",
        using: :nounzip
    sha256 "430993de045d2c470bb68a52d7aa3f2cabcdf3f14c0894489d264202d721d2d0"
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
