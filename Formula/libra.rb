class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.101"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.101/libra-darwin-arm64",
        using: :nounzip
    sha256 "24074387961da9212bfb8fa3af1899c4e7c74ddf50fdf739985b3e03ff5503ed"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.101/libra-linux-amd64",
        using: :nounzip
    sha256 "940b5a19b1fefe120de5dcbe18fb8d7179173f42aafc805e3f18bfe1e1448450"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.101/libra-linux-arm64",
        using: :nounzip
    sha256 "07464b20cda6e6f4eaca68693fa9ad719a1c65758558bbe2713faff90fb7bf58"
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
