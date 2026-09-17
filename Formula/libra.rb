class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.47"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.47/libra-darwin-arm64",
        using: :nounzip
    sha256 "bc8526d3eb08245f550c301232d4a38bb4289e2f5a717e478bb20fa710672361"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.47/libra-linux-amd64",
        using: :nounzip
    sha256 "d066ff33fc08fb3a8d17cf01223909c9fc3e2da6aab7ca4ebb8f796d4f192db0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.47/libra-linux-arm64",
        using: :nounzip
    sha256 "9423fd315180c9d19a01170bed9e8d4fa887844cc3e07b61a470b06d9fc2552c"
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
