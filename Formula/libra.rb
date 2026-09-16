class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.42"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.42/libra-darwin-arm64",
        using: :nounzip
    sha256 "dd73f2ff0063b3b2e91f2e7e9b5c0005c06c206627b8fae5123e21121bd210f2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.42/libra-linux-amd64",
        using: :nounzip
    sha256 "77af21f9b13143446a09ea010fdfbfae2fa118168e72123c1812988caa5938bf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.42/libra-linux-arm64",
        using: :nounzip
    sha256 "4979b4470b46c9db2d59ce637566bb22f113f95d7bfab6594029607730ac8c7d"
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
