class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.28"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.28/libra-darwin-arm64",
        using: :nounzip
    sha256 "f99d1c5f59efd484402d69495eaa2afef3d8b525b1d28a4881188ef53c94a023"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.28/libra-linux-amd64",
        using: :nounzip
    sha256 "d946b571df59ea739561a5349a458ed40e3d4f2a3fed48a68f572d9f6aa07573"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.28/libra-linux-arm64",
        using: :nounzip
    sha256 "06d9053896f486a748ec0ecb2ae7d19684b503caaa32f887670ba2661511ce28"
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
