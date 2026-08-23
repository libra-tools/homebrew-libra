class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.20.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.20.4/libra-darwin-arm64",
        using: :nounzip
    sha256 "62b44642773d61e6d0b21b9442baf2b71450a2770a0bc72eda68b67a34bc9406"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.20.4/libra-linux-amd64",
        using: :nounzip
    sha256 "96263afa23a4db7c9460926a4d7e86bd7edd751058c054c21f853f18fb6d5756"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.20.4/libra-linux-arm64",
        using: :nounzip
    sha256 "bf7f32cc6eb2082b95f14c0b136c620328386040515dae190d29f91089140395"
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
