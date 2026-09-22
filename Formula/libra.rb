class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.45"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.45/libra-darwin-arm64",
        using: :nounzip
    sha256 "a288370bdaff119fc45710f108d0102bfc795e27debb60a1c9ea5c9246885d7b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.45/libra-linux-amd64",
        using: :nounzip
    sha256 "f0c1a588d4f12890f24f3961d4bdc85227da834e9795b16f27dbe934a8d0a7d1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.45/libra-linux-arm64",
        using: :nounzip
    sha256 "e2467b16f9c5fcf141045df4189a55aed9791f3a9974c604ce6e3d52d1ffb7b8"
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
