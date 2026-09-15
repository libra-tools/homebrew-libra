class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.29"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.29/libra-darwin-arm64",
        using: :nounzip
    sha256 "85b895ebcd352f0079a8b959702e6ea5a46154e8c2a7a99743036093e0614025"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.29/libra-linux-amd64",
        using: :nounzip
    sha256 "b9e372b359cef033af76b5a4b7d1e10c122c98dd4d73936143f0fbac026adb3f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.29/libra-linux-arm64",
        using: :nounzip
    sha256 "6b139babc3d545667da0bd950a8ec1139dab0260417757ea3adc26a30b1c3c62"
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
