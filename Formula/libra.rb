class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.146"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.146/libra-darwin-arm64",
        using: :nounzip
    sha256 "04742d8239457546f4d50c09fa63c902c44ef33f8760595961383a1daf0c8de6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.146/libra-linux-amd64",
        using: :nounzip
    sha256 "ebe5c7178ca16c3889887e7b3f9d5fe37f0b60a863f278564d628b1ca33042c5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.146/libra-linux-arm64",
        using: :nounzip
    sha256 "cf3f298f54943f822c8944bf0b3f6da2f170494b61b29f51c28ffb1c81f51e1a"
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
