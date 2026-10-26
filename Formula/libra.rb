class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.88"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.88/libra-darwin-arm64",
        using: :nounzip
    sha256 "d122f18f197604b77ab05ce330a285591a48700c3c50d4c145004f2c4e99ed8e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.88/libra-linux-amd64",
        using: :nounzip
    sha256 "481e92a4c57174e38c321838b3d76c743d36b484a4fce63c1dfc732f447b9de3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.88/libra-linux-arm64",
        using: :nounzip
    sha256 "66b292eccfceac6379814f20d327ed709c3ce8c1f4db52a150346f6ad58001d9"
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
