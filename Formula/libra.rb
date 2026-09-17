class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.46"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.46/libra-darwin-arm64",
        using: :nounzip
    sha256 "606fe857103cd63caf742cd20faf7b71521d348f56f58c6b587ba50170283d4b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.46/libra-linux-amd64",
        using: :nounzip
    sha256 "0e1a45485f83703863f6c8c77988c9f5105304cd07aa35c89d71cce0a12587ab"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.46/libra-linux-arm64",
        using: :nounzip
    sha256 "14c2714037592e36b5cfe450071bc860fa30f8d6e74ef3d7d795eed42da21e0b"
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
