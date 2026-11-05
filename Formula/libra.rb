class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.154"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.154/libra-darwin-arm64",
        using: :nounzip
    sha256 "8a20d73fd6dfe0b3943d2baebf57fed0ff0f202d9c06d260b9b0ee4d9a1be754"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.154/libra-linux-amd64",
        using: :nounzip
    sha256 "2f45e46c559584737321e9a5f248db192eba56093157004a5cc6ebc075ad734b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.154/libra-linux-arm64",
        using: :nounzip
    sha256 "af6f43280d26bb64eaca04c23072f24dc5762a6139af755bb9714a188006a484"
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
