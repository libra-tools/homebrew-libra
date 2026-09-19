class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.8/libra-darwin-arm64",
        using: :nounzip
    sha256 "799348b41ad1ac573a54629a181912f707efd795a9dca9db0de5b354700b38c8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.8/libra-linux-amd64",
        using: :nounzip
    sha256 "5e676c49a8fc46356419fd8edac911b63603216c0b7cc8d076e92ed08669a6a9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.8/libra-linux-arm64",
        using: :nounzip
    sha256 "2d6e3eca792e3c5b27c2f6e8831ad6fb7f7645500fdc428d9a22a33e408e5e48"
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
