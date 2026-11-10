class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.168"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.168/libra-darwin-arm64",
        using: :nounzip
    sha256 "b6c98d89320aa9c4dcac651df8c9b16d40006fa5b6a631c6e9313a0cad935caf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.168/libra-linux-amd64",
        using: :nounzip
    sha256 "c060dc4f6c5fce5eb9cd70174972c728b8e05331c6784e435e16cace406d6299"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.168/libra-linux-arm64",
        using: :nounzip
    sha256 "b289dc4afa3d32022d97ff8f713e27e94501513c77a7c6f1ece2161b28587c9e"
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
