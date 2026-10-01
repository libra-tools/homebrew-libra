class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.12"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.12/libra-darwin-arm64",
        using: :nounzip
    sha256 "aaee537632a6c2e1c97df2e884ed68d9c284b38a69fed1dfaf3fa64a5b0c3cf4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.12/libra-linux-amd64",
        using: :nounzip
    sha256 "b083f014b64071410af7b09510b11302596b8f8f9bcb78af6632815496d2a6bc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.12/libra-linux-arm64",
        using: :nounzip
    sha256 "986e9bbe553fa685da832f149d0f99d8ad6d9c6fb51624c5a8bcebc411982545"
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
