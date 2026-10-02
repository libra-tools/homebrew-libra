class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.22"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.22/libra-darwin-arm64",
        using: :nounzip
    sha256 "1feba56fa78562ca43e992f1236fd0b76c367932773f7116969e299105fccdad"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.22/libra-linux-amd64",
        using: :nounzip
    sha256 "012d9ae488654aebcedc9b4d554624982a8846e049d0c37ec888e63f54fd19cb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.22/libra-linux-arm64",
        using: :nounzip
    sha256 "4a6fd7db89e1b897bf5a2853d1a8270949c787e1d444ccbc697d4e0dd633b47d"
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
