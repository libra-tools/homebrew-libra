class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.116"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.116/libra-darwin-arm64",
        using: :nounzip
    sha256 "e0a8bc0a599407eaad8839fbf22f0e60e12f8d186e5efb7e877b28dda203679c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.116/libra-linux-amd64",
        using: :nounzip
    sha256 "c13e4f3248ff00e20dbc914cafc56804122a55b52f160a4ceaf29e494555e459"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.116/libra-linux-arm64",
        using: :nounzip
    sha256 "5794bc762d6b4fe242eb6861fa18b352c67f2d6df0af06e8f8f9c6397275a0ba"
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
