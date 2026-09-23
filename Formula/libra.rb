class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.51"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.51/libra-darwin-arm64",
        using: :nounzip
    sha256 "eccc6518d846b870661318a999ce55031631575973b6666c878f008dfa614e0b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.51/libra-linux-amd64",
        using: :nounzip
    sha256 "31124e52f806a730689139339c887db2fd5c4acd45d5c32d8d35fb4131e2e2b0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.51/libra-linux-arm64",
        using: :nounzip
    sha256 "c8c045c148c457ddb874bc3b4470a115bbd0fd2c0f01a234e2a66d7a865e320f"
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
