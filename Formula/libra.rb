class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.142"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.142/libra-darwin-arm64",
        using: :nounzip
    sha256 "4b9577238065787c617d57fbf7302b0a0fbd936da19751c5cc7a17a910ee8f01"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.142/libra-linux-amd64",
        using: :nounzip
    sha256 "885632631cecdb70500c2da49a080e709cf7fe33a454daa51b2e48194773abf0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.142/libra-linux-arm64",
        using: :nounzip
    sha256 "4ae91b348b929d12b2572a78d0ce1ece898612a25b42f8aaf07089b3dd8ef8ec"
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
