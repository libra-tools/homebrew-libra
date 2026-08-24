class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.23"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.23/libra-darwin-arm64",
        using: :nounzip
    sha256 "a5bed8658e38310f45c86b4241d24fe93ca4acfd288e15acfa5ce27de325a5d2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.23/libra-linux-amd64",
        using: :nounzip
    sha256 "2d52d27503c6e451da53409e914c6db9dc64042b2fb59047113d2d58f4fb5135"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.23/libra-linux-arm64",
        using: :nounzip
    sha256 "ac9ecc95b89002c29c7572eaae7448bacd974657a4f90de524741eec0e29c026"
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
