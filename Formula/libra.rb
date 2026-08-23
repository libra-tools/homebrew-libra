class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.14"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.14/libra-darwin-arm64",
        using: :nounzip
    sha256 "f711b7f9cbda6cc51b7f01361a9be3dbf7286a43ee8b659870328d23903bc9c7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.14/libra-linux-amd64",
        using: :nounzip
    sha256 "89429fca74f9fdf4534e7860c0398502087adbb8e5625de6c45622149c3f81c3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.14/libra-linux-arm64",
        using: :nounzip
    sha256 "a862225f5eb7cec721d0d0abf3e962f52ccbec86b9648477d7b5b27da791fa9b"
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
