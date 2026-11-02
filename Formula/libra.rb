class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.137"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.137/libra-darwin-arm64",
        using: :nounzip
    sha256 "1cfac26093c8119f41a0cffc5a4d36f394f0a7c5e873257aa65aaf52c9c146c7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.137/libra-linux-amd64",
        using: :nounzip
    sha256 "68b3dc5b7e401050c3941a592538e7bbe165186887f061ae7fd730fa2171999c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.137/libra-linux-arm64",
        using: :nounzip
    sha256 "89f3b3f6219593ec18a2d966b2cc546d77375c25a85580152c180a5a61b04abc"
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
