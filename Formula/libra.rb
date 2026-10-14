class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.49"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.49/libra-darwin-arm64",
        using: :nounzip
    sha256 "fffd723d0997d2cc0a2fccad7e31c0ae0d19f55d648ed635b3636f1ac051409e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.49/libra-linux-amd64",
        using: :nounzip
    sha256 "4e8c8b5e4e6e7ba8390e6ba142d8eabc7b3792afcb5ce856a728470c9a619249"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.49/libra-linux-arm64",
        using: :nounzip
    sha256 "2500c5a02d10e0cce489580e65991883bb6bdee4c2cca50c82f77f6bc4874df9"
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
