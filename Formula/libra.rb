class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.113"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.113/libra-darwin-arm64",
        using: :nounzip
    sha256 "69af909e1079b699c0e7ed3fdda7bee8e5a61c5cd129f7ec3102d82261f4cfc7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.113/libra-linux-amd64",
        using: :nounzip
    sha256 "946b1ba18530e10a2d1781ad69d628c14a253dab651c37511d9affa9c814ba19"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.113/libra-linux-arm64",
        using: :nounzip
    sha256 "fd7d6110051223237f721cc51f6a16d6c3431350d0c44a16309960c7cab8b5f0"
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
