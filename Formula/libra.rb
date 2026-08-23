class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.15"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.15/libra-darwin-arm64",
        using: :nounzip
    sha256 "a1b977f84d306413d2ad8b572ff92b8aa9b58cc26cfdf146b14766cfa31c7386"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.15/libra-linux-amd64",
        using: :nounzip
    sha256 "86e539e55993ba85e6063991f1f4ff4baf074f71efe1cf98e2099e71651c65eb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.15/libra-linux-arm64",
        using: :nounzip
    sha256 "9da053cd8c171b407012e5bb4c966ace532bcab9625ef900ed9b2d5102138d87"
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
