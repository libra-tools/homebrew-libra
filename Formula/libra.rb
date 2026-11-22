class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.276"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.276/libra-darwin-arm64",
        using: :nounzip
    sha256 "ce4b2da0b27ff22e512419876cfda1c7997414fb265e6b4e51d6c02b01bb8dac"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.276/libra-linux-amd64",
        using: :nounzip
    sha256 "4fb7dce56e43456adff0eb8967a492cfe673f5e6a2e316fb01b5c623a2049dbc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.276/libra-linux-arm64",
        using: :nounzip
    sha256 "2d8fcd1c65bce0e033b417fe0144f209f78fd69a81f237b81c78b82ceab6883c"
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
