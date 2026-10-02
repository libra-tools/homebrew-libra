class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.19"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.19/libra-darwin-arm64",
        using: :nounzip
    sha256 "601021895c5184ee86aced2b17a5c2509552f5e27a1a141014f953a38598dd78"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.19/libra-linux-amd64",
        using: :nounzip
    sha256 "08d01cb02e0f1882dc4c495c75c3fc554eef83dd36c45c54b5e78cb828fb0f03"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.19/libra-linux-arm64",
        using: :nounzip
    sha256 "acc5ca3761414786dd151194ed31879369e5a3a443baa78bc55f910c152e8402"
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
