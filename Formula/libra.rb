class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.52"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.52/libra-darwin-arm64",
        using: :nounzip
    sha256 "f4858c3f83fd69d77bcc854f9a6ff2707359f95e673556c2eb5e89cc1e811986"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.52/libra-linux-amd64",
        using: :nounzip
    sha256 "25df7b3fe82839c6c1c5b364ef9e3f0fab78b8883812a8a65098a99e9c57d6c4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.52/libra-linux-arm64",
        using: :nounzip
    sha256 "1a4c1c8465c640e02fd0a34b26a7ce6d6f164fb0b96ae245a7c4df24bcb40b30"
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
