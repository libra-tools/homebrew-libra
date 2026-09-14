class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.21"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.21/libra-darwin-arm64",
        using: :nounzip
    sha256 "346ded4be3bb67460a804e4118134b7fff91ad588d122c9050e5141f14a3dec5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.21/libra-linux-amd64",
        using: :nounzip
    sha256 "d944a62cc3da4fd8623f99f8f2817fb9e0415d901994d2628bbc0c07c27f240a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.21/libra-linux-arm64",
        using: :nounzip
    sha256 "7c170fd471c3310839eea80ed876db6e0dc23da3adb21852f5faa6014919e8af"
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
