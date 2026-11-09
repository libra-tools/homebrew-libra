class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.164"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.164/libra-darwin-arm64",
        using: :nounzip
    sha256 "e1032384aad0940751d8b4288863b89242a37c731d144555161ea5a4b26e337a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.164/libra-linux-amd64",
        using: :nounzip
    sha256 "c46c98b4f5d6f81f46a973cd65f3cdadd1e382a5d779b66f4213d66f7690f99b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.164/libra-linux-arm64",
        using: :nounzip
    sha256 "cdd8354c27440fa58703cb30978677cc702ba98060baac8b07b1d8ab4df4f07c"
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
