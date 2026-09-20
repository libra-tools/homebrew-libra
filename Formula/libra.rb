class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.24"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.24/libra-darwin-arm64",
        using: :nounzip
    sha256 "5a8a740d226f205a0b9c63102d70d46a479f59eb08d647887fdfd29f2ef3a57b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.24/libra-linux-amd64",
        using: :nounzip
    sha256 "483098e2b30d32d96a763e7c59fbaa8862640fdd59aaa1d07e4a358da5476d09"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.24/libra-linux-arm64",
        using: :nounzip
    sha256 "8f11ea2f12d0d2015882e42ac7db0e24fcc0825e7e02d1f9b22b4dcf4824e53c"
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
