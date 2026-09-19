class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.4/libra-darwin-arm64",
        using: :nounzip
    sha256 "04d51a044699c9016916c112a9cc84ea2624a881facfd7d2e4fab2a97ab03f95"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.4/libra-linux-amd64",
        using: :nounzip
    sha256 "e4c6cce1516f2d73dae11ce33411d7434f77b28e447743e9023cb5a18d1da957"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.4/libra-linux-arm64",
        using: :nounzip
    sha256 "c06cd9bde03334afccce1f1f78ba64bfd798359ae5bd889acb3bfd3d44776d4f"
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
