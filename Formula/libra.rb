class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.61"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.61/libra-darwin-arm64",
        using: :nounzip
    sha256 "38dc48d494acb6207085786c41091bbd43449743acd0e0f4641af908566137dc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.61/libra-linux-amd64",
        using: :nounzip
    sha256 "145e4f22f78b83b96e8ddbc70c87d827768aa8553ea2d7f4ab500ed1f89d0627"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.61/libra-linux-arm64",
        using: :nounzip
    sha256 "9610f8ef0be375dabd0df8491d026c0be96f402e0da02b80f9aa9c5e9ce2f6ef"
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
