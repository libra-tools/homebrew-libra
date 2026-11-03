class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.143"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.143/libra-darwin-arm64",
        using: :nounzip
    sha256 "157ecfb33e5d1c2f2157e08dd48baa306556b84892486467a705ad6056735842"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.143/libra-linux-amd64",
        using: :nounzip
    sha256 "34b79e844b8634ad5bc901242723cf62e269bdcaa4512a56ada697323d7b1cca"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.143/libra-linux-arm64",
        using: :nounzip
    sha256 "ade614ee9735945a839633c750dd2d9b886d27c34b404a6a2d9b975966344a1c"
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
