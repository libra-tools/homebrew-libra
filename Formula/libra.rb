class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.99"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.99/libra-darwin-arm64",
        using: :nounzip
    sha256 "ab46af41102e1eec75115251e02d944dfb9a28d4bf834ce1aa2fa58895eb7945"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.99/libra-linux-amd64",
        using: :nounzip
    sha256 "ed52cd4687afe76e84dd295dc0fde396df2772322ebc75d24ec3424d3d0a470b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.99/libra-linux-arm64",
        using: :nounzip
    sha256 "9cf3980674a8bd94fa8f9f5e432e27f4ddabe1fbc28e68a7aca1a64bf1753985"
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
