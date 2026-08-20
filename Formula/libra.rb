class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.20.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.20.2/libra-darwin-arm64",
        using: :nounzip
    sha256 "c4646a5210cebf801e006e4401f0abd8da23558eb13eca40b34bd6f8cccebc38"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.20.2/libra-linux-amd64",
        using: :nounzip
    sha256 "89de772306fbab30be24eef4fb30d35530eb98264ce478dca449b9a0d21df1c9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.20.2/libra-linux-arm64",
        using: :nounzip
    sha256 "4a2bc21c48981036c3fdc3070a4c4d9175b2568143b9cdd85c74824073cddc20"
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
