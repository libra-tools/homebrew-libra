class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.108"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.108/libra-darwin-arm64",
        using: :nounzip
    sha256 "e4bdfade09edfc06c2f51ec22dc86d2c981a163c912f18da90d8f0973d78466b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.108/libra-linux-amd64",
        using: :nounzip
    sha256 "0fe136a733b7a5f8b16e5044a8013c2d580fcea73d52570b4df74d26b43bcfb4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.108/libra-linux-arm64",
        using: :nounzip
    sha256 "7babd2b24d5d17d7e3da7ca543b743d1d126e4ab043b1aa490a8561e129a3f68"
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
