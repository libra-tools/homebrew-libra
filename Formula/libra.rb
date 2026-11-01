class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.129"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.129/libra-darwin-arm64",
        using: :nounzip
    sha256 "009f3b03aeb63096ccc4ddf6fb0b031372935256ee6f357c1825fa1555882cbd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.129/libra-linux-amd64",
        using: :nounzip
    sha256 "97429623b596dc023cb1f932cd32588f3a2d8f6dd49568d71911c845d4ecfab4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.129/libra-linux-arm64",
        using: :nounzip
    sha256 "4547eeecc8956b42f57e5ca160829d538de8290fb084b270efcbf8b3965827fd"
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
