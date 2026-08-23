class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.11"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.11/libra-darwin-arm64",
        using: :nounzip
    sha256 "ea603f3208edce64200fe2f8427af1973c698e122cd5d6d53eb821851ea3a06b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.11/libra-linux-amd64",
        using: :nounzip
    sha256 "c1603c8c3fb167f5373f47c340b6418ad26310a99ed5f6f0db53508a9e8f2a04"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.11/libra-linux-arm64",
        using: :nounzip
    sha256 "afafe5329adb72b6cb86a0aaf7a493cb60cd2d7c0c88b136fc7fe941484f1020"
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
