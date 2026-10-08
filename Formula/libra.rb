class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.39"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.39/libra-darwin-arm64",
        using: :nounzip
    sha256 "d2c44e5a01fd3f353650dae455893eaf3e840101843e12227c77614fcfcadc6d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.39/libra-linux-amd64",
        using: :nounzip
    sha256 "7d379faf1ef6306ca2c391d9c8f86c26b7752c357ce280b753381e8eff4b880a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.39/libra-linux-arm64",
        using: :nounzip
    sha256 "4935595e83e2e94aba1d207ea6a157fac42d4d19b9725d1c206ca08fa5d42c00"
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
