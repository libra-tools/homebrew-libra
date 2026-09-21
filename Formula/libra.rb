class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.42"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.42/libra-darwin-arm64",
        using: :nounzip
    sha256 "269775b37bef45f62767de0143e2e116b0b8c6271c519f9fff722f907e6459e3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.42/libra-linux-amd64",
        using: :nounzip
    sha256 "43a64944e61e8a149d83b296b699bf83822f46d92a11c362752b3d7fec1c7f50"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.42/libra-linux-arm64",
        using: :nounzip
    sha256 "6b20a19f499027aa709d9fc53116e5025ab8ab1587094294fcaf86bf7148d4a9"
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
