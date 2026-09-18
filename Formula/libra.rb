class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.1/libra-darwin-arm64",
        using: :nounzip
    sha256 "cafab0931631ea0233f96f6957764e0d9f18b9548cbda9e1eeaf6b072853a64b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.1/libra-linux-amd64",
        using: :nounzip
    sha256 "79fb17e52dfd0bbcbd4b24517d43eef08a992262ea77280b4afc5b3cd95f18ad"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.1/libra-linux-arm64",
        using: :nounzip
    sha256 "212257c4c482767b33ef042f120206ca04e259a235dc0eb8cf1e24c7f8e264ca"
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
