class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.73"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.73/libra-darwin-arm64",
        using: :nounzip
    sha256 "dd3a359d2c14ef8f9755443aae649512e104123d16e3d0bf68dc2cb2cd179464"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.73/libra-linux-amd64",
        using: :nounzip
    sha256 "f14f80c460ee9cb75125e6a007f6db38f4f2b8f9ba2b53fcbe2790eba20b6b9f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.73/libra-linux-arm64",
        using: :nounzip
    sha256 "ba6feba7618a511944cc98eb47d844c59d48a8cf7ae42b6b6337c1e94bbe20fe"
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
