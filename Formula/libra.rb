class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.140"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.140/libra-darwin-arm64",
        using: :nounzip
    sha256 "2a1fcafe474ab20f7cae19fa0822048af00c17a1c3ac7ef26a7dc28a4fef2150"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.140/libra-linux-amd64",
        using: :nounzip
    sha256 "4dd3f66122493b0ccc6a7106f54ad5ee727c4484cf5a31a48c7da87baaeb024e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.140/libra-linux-arm64",
        using: :nounzip
    sha256 "28f56e329040ca9d60fc1759c1a2bd4efdf034ceb4f897be488f2f3729f03262"
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
