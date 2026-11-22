class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.277"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.277/libra-darwin-arm64",
        using: :nounzip
    sha256 "e928e2e6798cbefc93bd4e5562e59fdddc3ea9c85db8190164a95a9185d5395c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.277/libra-linux-amd64",
        using: :nounzip
    sha256 "71a8fcd77773bec7a4e33a3482b3f4c268f9e4a08fa1a4630fb2b9fc7f9ea7d1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.277/libra-linux-arm64",
        using: :nounzip
    sha256 "b0e7be2f9e76137cfb603549267a8d565ba8816ed385c6f2111ce521bfb906bd"
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
