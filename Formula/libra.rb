class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.48"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.48/libra-darwin-arm64",
        using: :nounzip
    sha256 "26878d8b52ad8ba87789a07e8823cbcc2c4fa554f19fafb8197e0a431e13686e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.48/libra-linux-amd64",
        using: :nounzip
    sha256 "8691e05ae96248db6368c10e528c2489f3439101bcad11c5d80ef97daaaeabe8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.48/libra-linux-arm64",
        using: :nounzip
    sha256 "fa6e622e69f30aa4f6e917f02d02cbf3e6487504244cc295c482e3bbd3634720"
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
