class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.24"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.24/libra-darwin-arm64",
        using: :nounzip
    sha256 "659f524580f4ffe345992de14b458d3dd38d1e70137bcee125b27594565fe085"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.24/libra-linux-amd64",
        using: :nounzip
    sha256 "8de7da8b4074813eff5cef57f18d99e4f9fb016951909532a11c5d86b8b20771"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.24/libra-linux-arm64",
        using: :nounzip
    sha256 "cc565f5ab776b259d28c5e94fc585d87ff3e863c16a449ad63a3d6af1a49ccf1"
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
