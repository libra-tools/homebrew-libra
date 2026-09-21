class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.41"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.41/libra-darwin-arm64",
        using: :nounzip
    sha256 "e102cd8578fde752129ab8e89b5f6aa604b0ed4a30c5dc48708c880e91034b01"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.41/libra-linux-amd64",
        using: :nounzip
    sha256 "69d0d6217add73f8456736b432f637c7a0d86d55f8c19e2af0bc0e9d094c48d9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.41/libra-linux-arm64",
        using: :nounzip
    sha256 "b99f6726928215ea4e27810aedb3205d9d77212c5c208e5fd1fc934aa56ff4fd"
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
