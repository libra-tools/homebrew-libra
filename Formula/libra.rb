class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.115"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.115/libra-darwin-arm64",
        using: :nounzip
    sha256 "27a9378e74a5026a7ea22886ff10d7e2b47d1c35bd2645922d87c697305349aa"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.115/libra-linux-amd64",
        using: :nounzip
    sha256 "a1cd95c78171d80f76cd170125f95d198f59923b5246ec2d887f8750d6d9b2f1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.115/libra-linux-arm64",
        using: :nounzip
    sha256 "ac38208c0a79506e99559ee9668cfca466bff6a1f7d511a25e075c926062a301"
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
