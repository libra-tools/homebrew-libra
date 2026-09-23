class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.54"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.54/libra-darwin-arm64",
        using: :nounzip
    sha256 "c020222a7e8289082a3a391bb1fa3642780c61028ff7081ccc8974e023c4416d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.54/libra-linux-amd64",
        using: :nounzip
    sha256 "a031e873b60d1148b6ec064fb9256800e0f37e5d95a67ca5b398da80924218a8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.54/libra-linux-arm64",
        using: :nounzip
    sha256 "02c5e85171ea537d4ef1f6d2ca5772fa117fc2fe3157ae20280e29ec172aa1c9"
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
