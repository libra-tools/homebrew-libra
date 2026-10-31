class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.119"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.119/libra-darwin-arm64",
        using: :nounzip
    sha256 "5c85ba82daeb913b016238c1b0e81ef9f7f30c88e06b0cdaaae1ae5ca33083a3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.119/libra-linux-amd64",
        using: :nounzip
    sha256 "f171adf7140c6df06f39d63035ccb12b8a42746cf992911aafbfa31c9fda8af3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.119/libra-linux-arm64",
        using: :nounzip
    sha256 "f1ac0d6c3087b168538f879cf53b65713dfa9fa6af01fecb897e167cdd9b452d"
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
