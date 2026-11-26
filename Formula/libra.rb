class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.512"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.512/libra-darwin-arm64",
        using: :nounzip
    sha256 "9e89118197690b9a269c0d101da8c87d6414f48dc5503967ef635f10f1962adf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.512/libra-linux-amd64",
        using: :nounzip
    sha256 "8595cb8e4c9538c1bde50579ec7912b872476c1a9aaa184555f375172064a2ad"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.512/libra-linux-arm64",
        using: :nounzip
    sha256 "c925647fcc6e321b47f5de46596bf8cd761c19537f04a77f2c6a974f5402bc55"
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
