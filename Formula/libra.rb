class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.208"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.208/libra-darwin-arm64",
        using: :nounzip
    sha256 "85537b3b9b780313ba4177961ff996c51b616141ee5a1b64641742a0388e1496"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.208/libra-linux-amd64",
        using: :nounzip
    sha256 "24c279907f6e4a28be6a1f424834afd32de50bf75123977704e219523908fd7d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.208/libra-linux-arm64",
        using: :nounzip
    sha256 "877b6506e2208b700df4a776b967fcbae23aeded6f39d36d8c27b489796f2739"
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
