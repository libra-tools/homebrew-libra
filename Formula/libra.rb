class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.24.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.24.0/libra-darwin-arm64",
        using: :nounzip
    sha256 "411e6627630972f957603d60a72f4ed885d740c9a94f697e0d7c2248cf4d3dbe"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.24.0/libra-linux-amd64",
        using: :nounzip
    sha256 "a02753f4bbb1d57be4cf7574c1d3f3cc39c2022aeedcee04dec841eaba4f2ec8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.24.0/libra-linux-arm64",
        using: :nounzip
    sha256 "01157a9cbdf6851a755098782aa839dd3eece52dd9f848c6198748ec4f1d1163"
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
