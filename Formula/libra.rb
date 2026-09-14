class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.25"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.25/libra-darwin-arm64",
        using: :nounzip
    sha256 "b9a3b8961a39b18c40a8a178cdf3c21ab4f6a9fb099833efa7dc20d030ca85f7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.25/libra-linux-amd64",
        using: :nounzip
    sha256 "413d1e8cc9d789ed39a535f6d304654f32c4f123388e6a502de3aa60fb87327f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.25/libra-linux-arm64",
        using: :nounzip
    sha256 "50e56f4dddc97d7209b1c6540fb671eb2dce43d19621efc0dbe4b8e47bb34969"
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
