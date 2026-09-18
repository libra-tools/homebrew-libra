class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.49"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.49/libra-darwin-arm64",
        using: :nounzip
    sha256 "f6af5234156ed6495fef840016524352f4ca2d514cc63c356d10a91f5af6bc83"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.49/libra-linux-amd64",
        using: :nounzip
    sha256 "d4703ebe9baa84ef2ef5a2820644e899c5a7839e5290093454820a5a4164fb40"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.49/libra-linux-arm64",
        using: :nounzip
    sha256 "2ca22b82e75b7bb0cec7e39994fc3db53d85109c67bc081ba2142f889e5ad509"
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
