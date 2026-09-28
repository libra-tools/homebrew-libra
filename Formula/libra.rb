class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.2/libra-darwin-arm64",
        using: :nounzip
    sha256 "61f1f87fc8a395407a4054dcf2e3d23c1a673e1d1836890eb7bfbacdc89b7298"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.2/libra-linux-amd64",
        using: :nounzip
    sha256 "8c2cabb65d9f04fd5f33f52b75b7fb2e14394cbfcb48156b6de1fd068e964d59"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.2/libra-linux-arm64",
        using: :nounzip
    sha256 "2a87768fa337fc5d55bac6d85260ff7d06a63c0c0d8560eea49ae439775d7d78"
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
