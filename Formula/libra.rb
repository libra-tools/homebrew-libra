class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.153"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.153/libra-darwin-arm64",
        using: :nounzip
    sha256 "f1219dbc713aded823618a4b602e15fb76e1fda0e77a525ab63bc177df5720a7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.153/libra-linux-amd64",
        using: :nounzip
    sha256 "0b0ae34aa27c21ed47e7f4387d35106a72193becb87a74f931f2025be0365f4a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.153/libra-linux-arm64",
        using: :nounzip
    sha256 "632c74415bafae736fb18d94eb24fb21d21930b70a0669db8c7c3492160a460b"
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
