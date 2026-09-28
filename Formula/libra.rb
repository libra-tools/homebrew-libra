class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.3/libra-darwin-arm64",
        using: :nounzip
    sha256 "fae4e1612fbaf06a249d13d7a62aed96050e7cb3eea0449b7938ec974a705cc4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.3/libra-linux-amd64",
        using: :nounzip
    sha256 "4136a5b2eaa0720e1a9168b2090c814e1d0839c1827b5cf3dd8dcefa212a8504"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.3/libra-linux-arm64",
        using: :nounzip
    sha256 "cd2c0519906b6361ea90f7bec3b501c733ebc35d37112b313e61f55db4d3b5b4"
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
