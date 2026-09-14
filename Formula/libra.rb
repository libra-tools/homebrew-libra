class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.22"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.22/libra-darwin-arm64",
        using: :nounzip
    sha256 "141dcaef98b2b26bf420554f82bbafa1237aa6a9da9e060004d78ec82df9663b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.22/libra-linux-amd64",
        using: :nounzip
    sha256 "f150a9153a94bcef1d771f1dc11c00094c6f31615c3d0bc08b04470e48ea23c9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.22/libra-linux-arm64",
        using: :nounzip
    sha256 "ae530f374851f8ec01c030cc4f21739f0754bab852553e4e8a6ed96ae08ed26b"
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
