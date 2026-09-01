class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.10"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.10/libra-darwin-arm64",
        using: :nounzip
    sha256 "59ccfd954c193a406fd03feff6389413527e396b2e797a2d360461bac41fd3cc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.10/libra-linux-amd64",
        using: :nounzip
    sha256 "87170e565a983962a46f206c4ad83c89cc367ff49ad7faab2a8a7df08c31e3a6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.10/libra-linux-arm64",
        using: :nounzip
    sha256 "114098af5c2713f7b72fa805b6e08f4d25154ad6eab4d6a021135ed6a8d71cee"
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
