class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.59"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.59/libra-darwin-arm64",
        using: :nounzip
    sha256 "0a88f34cf35baf606b8f50cdfae196c2c68e7b324ecc0c1992449e8ea6d5aa43"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.59/libra-linux-amd64",
        using: :nounzip
    sha256 "34e3f4086324f5af1762e7935248482d22a36250787e7bfef4c05183ae4615a6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.59/libra-linux-arm64",
        using: :nounzip
    sha256 "d6b30bf2a074960897b7b6222b38e0dd846dfd63ea5ac8dd9529854d711da835"
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
