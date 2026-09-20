class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.31"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.31/libra-darwin-arm64",
        using: :nounzip
    sha256 "9223a3284b3c775646e7cc18cb3afd031b7839de01c62505ca97fe5a6f8ee720"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.31/libra-linux-amd64",
        using: :nounzip
    sha256 "b52d568a012b5bb114c3d98ca6611affa871c24541d1321e282478da02eb0981"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.31/libra-linux-arm64",
        using: :nounzip
    sha256 "6cfe198de4908506c422819851f480ae287f4ca8f990279b5280fbd86daefafe"
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
