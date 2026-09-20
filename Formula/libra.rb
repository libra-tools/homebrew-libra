class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.16"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.16/libra-darwin-arm64",
        using: :nounzip
    sha256 "8887784a74472bee2fcf355e969b9f9970af4de6e85e2603573d963f15c276cf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.16/libra-linux-amd64",
        using: :nounzip
    sha256 "f8707df2a670b5b670ff86fe320cbfd759521e8e4d43dc839cb3c550c31e4c66"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.16/libra-linux-arm64",
        using: :nounzip
    sha256 "a675533554799a390f8c1e219d7ae9b5cbf7347803d6b712cdc26109f6798520"
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
