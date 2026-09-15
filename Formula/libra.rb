class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.37"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.37/libra-darwin-arm64",
        using: :nounzip
    sha256 "3ed2a8fee2d143e0e81d1ad1bc79cf82398a67ef90d2e1c56c550c1b8c0dff9f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.37/libra-linux-amd64",
        using: :nounzip
    sha256 "22aae486e0d2f81ad9c78587436ba886ba54714f5c75a760289a113a6aa3876b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.37/libra-linux-arm64",
        using: :nounzip
    sha256 "845874b0e25e6a716afe4149b2a97b7a3013d26955b03f0fb09f20c0f09dd57f"
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
