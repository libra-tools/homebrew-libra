class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.56"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.56/libra-darwin-arm64",
        using: :nounzip
    sha256 "37fa1b5b0360c5f2866481758fe16b6738efce4d6d0765621179b59e6762148d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.56/libra-linux-amd64",
        using: :nounzip
    sha256 "796bef8034c2a797278607b3d77b581e65296fe9faf223a6a555d143add2a01e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.56/libra-linux-arm64",
        using: :nounzip
    sha256 "32f7053fd5b2898ec0b3f85042b51b2a6e89c45e8fbcd8cbb8b356e076fc6047"
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
