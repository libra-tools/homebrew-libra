class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.5/libra-darwin-arm64",
        using: :nounzip
    sha256 "494e96b7df331e82621ca7f0a762c3301100c2960fc22aac5cb9868856c37cee"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.5/libra-linux-amd64",
        using: :nounzip
    sha256 "2b0d0509bf839c61a5d520b2e783bcc63b0494792f24df7988865d14897e27e3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.5/libra-linux-arm64",
        using: :nounzip
    sha256 "094387b05e238297ce4405376486958bf4f70527c3e1c3deaf55f3c82faffdfc"
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
