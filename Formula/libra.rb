class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.49"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.49/libra-darwin-arm64",
        using: :nounzip
    sha256 "6aa07ab028cefd4b57006e40488dbbd9e1664a93ebb03b1834578c0a1babda0e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.49/libra-linux-amd64",
        using: :nounzip
    sha256 "12187ea8ee0714741949f02814e787f9b5a279ee3a3fe0873c78aefee9c15dcb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.49/libra-linux-arm64",
        using: :nounzip
    sha256 "9eae10191b481d320286e655329b62c895aeebf35470919518a5e831b02cf67c"
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
