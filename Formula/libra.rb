class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.47"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.47/libra-darwin-arm64",
        using: :nounzip
    sha256 "f86ef9b00324ef2b56735828ece76e2659586c9d1d546a453f9be354c1dcc36e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.47/libra-linux-amd64",
        using: :nounzip
    sha256 "4313dfb127aba24e5f2bd99286d2af2bd60e50c574e44616a081bc58bcd4cdfc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.47/libra-linux-arm64",
        using: :nounzip
    sha256 "2178e6bfda127b5ae5e95e6f981414fa895ab201413b7675c23a597bdebe3ab4"
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
