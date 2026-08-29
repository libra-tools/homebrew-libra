class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.0/libra-darwin-arm64",
        using: :nounzip
    sha256 "ddd2fcef210e994f141a53bb8273d5e61d37d35050a983df04abddd9aa19dda6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.0/libra-linux-amd64",
        using: :nounzip
    sha256 "463a1c90f3a94975948d8c64815b761f57dc91790d45b16e6d5bd267092c7b02"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.0/libra-linux-arm64",
        using: :nounzip
    sha256 "c9050cd7b612684baac753a4db2bcffc8f286b8ea99e9516a68f53c4f9138499"
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
