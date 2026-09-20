class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.21"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.21/libra-darwin-arm64",
        using: :nounzip
    sha256 "1b857b74bb98768fefdf52e08f1f6d5b9c2b994ff20182a14cf7fe04f2dae0a6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.21/libra-linux-amd64",
        using: :nounzip
    sha256 "3d3ec448d5fc2426ff80351f8cb4b93ef641f320f2c0e700e79372a7924ee3aa"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.21/libra-linux-arm64",
        using: :nounzip
    sha256 "28a2f93d684910805a1633a1188b06a6c48cbff73a0e1b1b4199fdab53c44333"
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
