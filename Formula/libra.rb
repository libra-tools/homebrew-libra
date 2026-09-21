class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.39"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.39/libra-darwin-arm64",
        using: :nounzip
    sha256 "3c919b3d082669c39b24412114f7964c421dfea31993282cd901c1bdedf2b23e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.39/libra-linux-amd64",
        using: :nounzip
    sha256 "a50f1a13c45e00bf69088ecb2164a859c3311e1e66b2983cf955c7933ad98b3c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.39/libra-linux-arm64",
        using: :nounzip
    sha256 "a5c16cdc0636fc82c73c5949eac6dded65b66e3bd393463f6a82c29584450cb1"
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
