class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.60"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.60/libra-darwin-arm64",
        using: :nounzip
    sha256 "69766cf3ab16223294d9fae39dfa5e569a18d943330e239bb32e717b398c63a3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.60/libra-linux-amd64",
        using: :nounzip
    sha256 "18793ad63ee8c1c32379051bcc8a99429fcac76bf63cfff266bcaa0659fcec58"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.60/libra-linux-arm64",
        using: :nounzip
    sha256 "98ec3fc8b943125183c958933b30a2aa11af755d043168ef1ee88015e71114dd"
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
