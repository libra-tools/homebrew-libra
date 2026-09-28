class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.0/libra-darwin-arm64",
        using: :nounzip
    sha256 "26f60ea54075622ab19218fe1cdc21c70cdfddd2091855c6fcab97323f6ab45b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.0/libra-linux-amd64",
        using: :nounzip
    sha256 "8d49e36452ca08b9423b109a577580fe9637144b3fd924975c6bb0d6682e4532"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.0/libra-linux-arm64",
        using: :nounzip
    sha256 "ec154eab3d5a2126d3f5736daf84867b7a27461fec26a7165f73e316dd82f351"
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
