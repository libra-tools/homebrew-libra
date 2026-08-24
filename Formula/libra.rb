class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.21"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.21/libra-darwin-arm64",
        using: :nounzip
    sha256 "3f6a9cce4f6a0b2d550a2247ad233811dd66ecfbd0276e2f3b03e7c5ede34d49"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.21/libra-linux-amd64",
        using: :nounzip
    sha256 "673466fa872175f65c34bac0353e4c2ec2239196c1b5e67eb6b8a95bfeb9c7a0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.21/libra-linux-arm64",
        using: :nounzip
    sha256 "81bc638fd659f7c40e6efcd16b192ae23a4580d67cf5f80cf3d172b40c91a5ff"
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
