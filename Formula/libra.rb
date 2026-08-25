class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.26"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.26/libra-darwin-arm64",
        using: :nounzip
    sha256 "c185563d5576b90bf0afec3dd973115c458946be401c34e8086d1d1b35f393e6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.26/libra-linux-amd64",
        using: :nounzip
    sha256 "80d11317dfe859949c97dbbc8d332c76fb10f97e42ac4ba86ffed8fda2c52753"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.26/libra-linux-arm64",
        using: :nounzip
    sha256 "c304613650608e5427cbc6a07171a7bcbab33858a86e0df1c0796d32b88bfb4f"
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
