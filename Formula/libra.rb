class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.229"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.229/libra-darwin-arm64",
        using: :nounzip
    sha256 "a6455ee928d819bd4678eaa811b588a7a7317738c35578fbcb57971a2bd1a1aa"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.229/libra-linux-amd64",
        using: :nounzip
    sha256 "7fe7b64ada99229f75f0edba0bf15d0d481dc134bd0501fa88f0a2e279064a00"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.229/libra-linux-arm64",
        using: :nounzip
    sha256 "516c4b95ebdbc77c79e301d30ef37f2a41177e9931cb6c437169e1c9a4505b60"
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
