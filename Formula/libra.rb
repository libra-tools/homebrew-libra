class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.17.1445"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/libra-tools/libra/releases/download/v0.17.1445/libra-darwin-arm64",
        using: :nounzip
    sha256 "17606e1ada838ed5f879a74a4fc6860a886e5e9c6ba0bc764eae5be4e616dceb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/libra-tools/libra/releases/download/v0.17.1445/libra-linux-amd64",
        using: :nounzip
    sha256 "78e347f5a23ebd6d1cca480f99b1854964b7d761746fa65154414f611b7d8311"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/libra-tools/libra/releases/download/v0.17.1445/libra-linux-arm64",
        using: :nounzip
    sha256 "178a99bde233319273d0fb795c45f2969ecf5b3d56534df948aa2b1f2fd53644"
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
