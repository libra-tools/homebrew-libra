class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.62"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.62/libra-darwin-arm64",
        using: :nounzip
    sha256 "13fe4c50b1c9148877f50c491a87c40a3bc57506793079422ecb41b43928d23e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.62/libra-linux-amd64",
        using: :nounzip
    sha256 "d6cf2668c867113067c616c0b0cda6fccc6b17244818bb8b442eb4248cf784f3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.62/libra-linux-arm64",
        using: :nounzip
    sha256 "9d37478a11a6debcce62ca88732c32a2f4d78d1f26f9d17074bc6f3e2a07afdf"
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
