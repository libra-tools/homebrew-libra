class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.207"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.207/libra-darwin-arm64",
        using: :nounzip
    sha256 "95b4aa92dcd2d9f426f043031f11e349730c368aff50f3ae73065dfb7b4236a6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.207/libra-linux-amd64",
        using: :nounzip
    sha256 "8c1e39a6ebbff22976c1e8eed0c929d730a92b67f4bb082fa2e66dd720f9ac98"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.207/libra-linux-arm64",
        using: :nounzip
    sha256 "1ead534280a069ef8235ff6311d297bca9a2d3976583e7db201b54ae5945a57b"
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
