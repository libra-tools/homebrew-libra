class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.11"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.11/libra-darwin-arm64",
        using: :nounzip
    sha256 "cbd31ea7879cf44615ab1c67affeae74adf883350a0f764082e4645bfcb01f3a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.11/libra-linux-amd64",
        using: :nounzip
    sha256 "d229b180a6f4fceffa6786bf418e74278f6bafe7c7f75e6b693d880216f3e3f8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.11/libra-linux-arm64",
        using: :nounzip
    sha256 "4b5becd597cc9bf5afbf4434d518fd6ecf2879bc2e2445f21c767c2a0db4ae6c"
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
