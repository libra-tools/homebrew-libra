class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.65"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.65/libra-darwin-arm64",
        using: :nounzip
    sha256 "e2f80ec67a6a35d1ab0ad52d9ca1b87529514e8b87751d7dde1a6a380e334034"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.65/libra-linux-amd64",
        using: :nounzip
    sha256 "563d60cd0a7cabba1053642be7119db6032eaf891ff893656789a06eadca9d4b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.65/libra-linux-arm64",
        using: :nounzip
    sha256 "ad8cf552531f6f112be13c90aae9fc6133816cf58e98b92c4c9db964a954378e"
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
