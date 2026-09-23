class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.57"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.57/libra-darwin-arm64",
        using: :nounzip
    sha256 "ace768149698caeaa5cd0668d3cebb4e7832df1895e2972fbc3b35fab8a63607"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.57/libra-linux-amd64",
        using: :nounzip
    sha256 "47243eb862fbc9cf64f92c24d9b76b3ff471b5fa23f112626104e11b19a11fa6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.57/libra-linux-arm64",
        using: :nounzip
    sha256 "bf700246a9cafa01271916f41d4f3e0ad3fb79d4073bcba704666f3364d18dc6"
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
