class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.2/libra-darwin-arm64",
        using: :nounzip
    sha256 "2e44f4b7241c2cc1fb1b4c6505e3de6ed5e8011191d195f219fd45296ca6fa44"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.2/libra-linux-amd64",
        using: :nounzip
    sha256 "6cff7a1890ca68faf475fa5dc5bc4bf9f6335d3c44ee22def598a147fdd6d714"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.2/libra-linux-arm64",
        using: :nounzip
    sha256 "11cb6bead02c44d6bad7c895b73d5b8a84a1db7a22a5e6ce649169870adf7d29"
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
