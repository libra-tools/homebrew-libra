class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.82"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.82/libra-darwin-arm64",
        using: :nounzip
    sha256 "2956ef65720e3e67e5810bdd61c435f9180f63a72d99c0adf5c51241993df604"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.82/libra-linux-amd64",
        using: :nounzip
    sha256 "46e88efab3f54508d85b0cba983cce10d37f5821c7d30d4275e5ad142e0b90ec"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.82/libra-linux-arm64",
        using: :nounzip
    sha256 "94af74b00ce1fbd02ff9edef804e5a1b296c321dd1e81410668256aadfb75e05"
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
