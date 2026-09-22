class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.47"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.47/libra-darwin-arm64",
        using: :nounzip
    sha256 "9c895a07b1acc85950ec2695568a7e19473257fe2782d679e4f381ea163354f8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.47/libra-linux-amd64",
        using: :nounzip
    sha256 "f9e7997d973e972a240f88182247e24633568b97fcb0a2db7299456ae2f7b823"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.47/libra-linux-arm64",
        using: :nounzip
    sha256 "76bea88b1c2f5eb1a1a59b4d531e3302fa514370670c2b15f1bc5a30ed48553f"
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
