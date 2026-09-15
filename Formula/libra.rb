class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.39"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.39/libra-darwin-arm64",
        using: :nounzip
    sha256 "f1991e2f842ac7369486099efb76e48264fc4d6dc73a0bef194e0fe3bbc27b0e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.39/libra-linux-amd64",
        using: :nounzip
    sha256 "e3f74df2af4b664d86a8f5150f38dd660ddb4d3d9acbbdc6f491105297ab0025"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.39/libra-linux-arm64",
        using: :nounzip
    sha256 "37463a058170b46385ad65402646cf7e1173a16847115c9689e23788fef715c3"
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
