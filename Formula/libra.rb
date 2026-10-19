class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.57"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.57/libra-darwin-arm64",
        using: :nounzip
    sha256 "b5980ba62846de42ff85b1cb7f25477a6aeef98b15d98db89ed393837b93bc55"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.57/libra-linux-amd64",
        using: :nounzip
    sha256 "3cd882b2697a043d1a5b5f32c4485a84f7f1eccac9d999bf38bc61f2b58043fd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.57/libra-linux-arm64",
        using: :nounzip
    sha256 "41eb11038ffceace93c24397006342b0c42d095466163d0531754e7bb9fa79da"
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
