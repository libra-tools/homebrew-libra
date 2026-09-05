class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.14"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.14/libra-darwin-arm64",
        using: :nounzip
    sha256 "fc4229331b6186eec311ed603cd9884c0c35f44d27d394a75e50dba6455bc1df"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.14/libra-linux-amd64",
        using: :nounzip
    sha256 "766bdf2fb6ed0a8ad372ef5c9aacf5bde6b296c0f24d6d60783afb78bc2b779d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.14/libra-linux-arm64",
        using: :nounzip
    sha256 "6869d740a4dde79d773dc20c75cf80fec22776bcfaba4a1a1816f6318d24a8c2"
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
