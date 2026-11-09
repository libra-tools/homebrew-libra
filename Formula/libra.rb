class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.165"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.165/libra-darwin-arm64",
        using: :nounzip
    sha256 "a64701ea927b46d7fa894ac127f3452d1424270941d6535530b4a1fa85c73da0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.165/libra-linux-amd64",
        using: :nounzip
    sha256 "763692d06da1cf2ab0ca27dd3c17537450cf434eef91bca64ddd86f5777ab062"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.165/libra-linux-arm64",
        using: :nounzip
    sha256 "88104cf1ae6db66e7268368d853aa55b7cc8739e0676fcb68bd04d67bddad1ed"
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
