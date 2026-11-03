class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.147"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.147/libra-darwin-arm64",
        using: :nounzip
    sha256 "13082f64c3038315809aa692e89de0ad4a79f39f32d9455d8724c9d7bf3d0523"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.147/libra-linux-amd64",
        using: :nounzip
    sha256 "e52da97158f429812da52da40ee99a49e97f1e7d9abc63743587ca34511cea25"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.147/libra-linux-arm64",
        using: :nounzip
    sha256 "1f00e399534c24715757627f3e325d4061c9e4767cf146434dd9dceaaad4241c"
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
