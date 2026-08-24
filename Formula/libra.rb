class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.24"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.24/libra-darwin-arm64",
        using: :nounzip
    sha256 "4290ee5c64949b986399ea822ab76ffe9e9ab304c826a6e36746057378372d88"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.24/libra-linux-amd64",
        using: :nounzip
    sha256 "a34fef182140374bdc281225181160fc71915bb5bf94fa235cb6077ec55ca955"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.24/libra-linux-arm64",
        using: :nounzip
    sha256 "aae61bd4e998cb806594cdc7bab5ed2dc5cd7a749e22b2a1fe554cc7fd592301"
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
