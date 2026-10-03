class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.24"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.24/libra-darwin-arm64",
        using: :nounzip
    sha256 "0171638f02af77f2aebec031381bb7ee18315c87c0c3f4c8a8abf8c14665dddc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.24/libra-linux-amd64",
        using: :nounzip
    sha256 "d5e119747b88b97f4008118823b398a174677a65cadaf9dfd7df87802223a9b7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.24/libra-linux-arm64",
        using: :nounzip
    sha256 "11c4c17011fed52c19e3a716bd215f96e788dc63a77332c5dbc4cd73732dbf1a"
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
