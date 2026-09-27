class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.25.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.25.0/libra-darwin-arm64",
        using: :nounzip
    sha256 "5c42f90989fb3d751e9def3afc13729c16882768b9e038ff0ea03c1bdbfc7e34"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.25.0/libra-linux-amd64",
        using: :nounzip
    sha256 "0aaf16b6e16776338e0efdb23ffaaa6aebd81d081be64fbfb10cf73d580e53b7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.25.0/libra-linux-arm64",
        using: :nounzip
    sha256 "b0d933950b2c6e10e62c4f2cd1e046ee2a35e34cd537b75b1ff4da277789deac"
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
