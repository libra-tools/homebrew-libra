class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.240"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.240/libra-darwin-arm64",
        using: :nounzip
    sha256 "22e4523b90e4d3c56f771b1fd57250aa7ac22cd5e454a359c2b1e9a8e907f982"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.240/libra-linux-amd64",
        using: :nounzip
    sha256 "fdae46bdc24b7a5005ea4b478b639beadeeab44149859d69b6c5c11ea4ea1f0c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.240/libra-linux-arm64",
        using: :nounzip
    sha256 "4f6b96bf8d020f72764451dbdc7c774dbd9f3260573633bb0d636a4de7398a72"
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
