class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.87"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.87/libra-darwin-arm64",
        using: :nounzip
    sha256 "1eda4a1b4e6a8b653f036f27350e6ce0e0250da96a16b1ad9830aa0ec1fe47f9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.87/libra-linux-amd64",
        using: :nounzip
    sha256 "66cf52e066dda92bb32415845382fee2e26205511f1284efba76c97d1323abf7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.87/libra-linux-arm64",
        using: :nounzip
    sha256 "8cd77a8618c165b548f5f56fb36f81c75e556c05215a4e7454d08d2ac5d1eda5"
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
