class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.151"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.151/libra-darwin-arm64",
        using: :nounzip
    sha256 "937c4683490fb2eefb3fc3df640dd8c134fb41e07d16f88c1629c3b76c803865"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.151/libra-linux-amd64",
        using: :nounzip
    sha256 "743b288ff8da74c96133995cbb21dd2803ba95b33315144b729dae34484f623e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.151/libra-linux-arm64",
        using: :nounzip
    sha256 "a1bed678677e49d2ac52d4a205c6cf228e2c5091150927f5e9ccac59e40012d4"
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
