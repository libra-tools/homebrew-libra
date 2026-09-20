class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.10"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.10/libra-darwin-arm64",
        using: :nounzip
    sha256 "310f5290141a146573a79178ce99a84734990274398367ef3abcc8c8e277e1b6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.10/libra-linux-amd64",
        using: :nounzip
    sha256 "b2c7b0a07dc436891e29cdab707b0e72895b5d6dc9ad54fc2d48ebe05f40d4ca"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.10/libra-linux-arm64",
        using: :nounzip
    sha256 "92d313641f1fe2c3c4e975ce63388a05be9e772ea5ae5681238b784d50e37b21"
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
