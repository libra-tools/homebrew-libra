class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.15"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.15/libra-darwin-arm64",
        using: :nounzip
    sha256 "967a6bf93a0bbc878387986f6dad206c75ba0fdbef961969119df44ca4a98079"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.15/libra-linux-amd64",
        using: :nounzip
    sha256 "627268dbe0235bc914a5ba573aa2b3ae4e8d54c8e5677e8d59e013e58310bd54"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.15/libra-linux-arm64",
        using: :nounzip
    sha256 "e8c6ca901112d6c36fd843cb4065aa5843a68d0f9d4ea4417160302f15bb316b"
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
