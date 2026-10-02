class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.17"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.17/libra-darwin-arm64",
        using: :nounzip
    sha256 "8dce0bbd8202c411176be730a3dc3304a6aa7b13dd1c0ea0c61c48649c85be25"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.17/libra-linux-amd64",
        using: :nounzip
    sha256 "478fc658ea96d4177199d3b3b06e1a790a621dad5bbd5966b273c3a33218a8bf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.17/libra-linux-arm64",
        using: :nounzip
    sha256 "026472d07f2101230d13b58ffafe4b292919fa1b4cd887df8a6632a0c871a0dc"
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
