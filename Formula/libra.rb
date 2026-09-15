class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.38"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.38/libra-darwin-arm64",
        using: :nounzip
    sha256 "a3681d22c4c19485c20d4076c5b11f20452a37dc6b0e2111dfe2f19be3161961"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.38/libra-linux-amd64",
        using: :nounzip
    sha256 "53767984caf6158373f3523e2d333baca93feac7a42ea905fe115f7690da2bcb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.38/libra-linux-arm64",
        using: :nounzip
    sha256 "af7e386c4bfcede2d9ac26e54ff2f3295ce7fa5ecd42e6f0c2a11025c5addc6b"
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
