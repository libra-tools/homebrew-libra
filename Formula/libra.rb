class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.100"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.100/libra-darwin-arm64",
        using: :nounzip
    sha256 "f94859a76bd504615bb56a7f9e21d510fe15d621f969e1726175ab4ef8b7fa0b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.100/libra-linux-amd64",
        using: :nounzip
    sha256 "e210caff4a77eda882b6683fddc59d97c96329e8ab312f189d564b83f0798fde"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.100/libra-linux-arm64",
        using: :nounzip
    sha256 "281a947a2dfbc35ccb8e3767ea4c43809292d5a13c026e08eebfc16f0ceb9496"
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
