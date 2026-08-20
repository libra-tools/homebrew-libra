class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.20.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.20.1/libra-darwin-arm64",
        using: :nounzip
    sha256 "d5b6313d83dda1d1ac8bfd9bfbe20e869ed9111dbf6142e79ac7a4172c0f248c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.20.1/libra-linux-amd64",
        using: :nounzip
    sha256 "b8b283c0024d565a9323d930ef5a84af30b86a2b18dee0eb23fb9d892979990f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.20.1/libra-linux-arm64",
        using: :nounzip
    sha256 "7a7c85a0c53cc6da36b87ca7f0946e1f5a14032bfbf0540d73e6f89faa4953dd"
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
