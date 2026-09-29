class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.8/libra-darwin-arm64",
        using: :nounzip
    sha256 "de5adb8994dc46edc91514a25c18aef844d3839793d88e2f3a672b0768c7fb6b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.8/libra-linux-amd64",
        using: :nounzip
    sha256 "20bfdd6e86f1aac600ec0247879a7620f1dda7b91e9b6f9510307c394eefad5a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.8/libra-linux-arm64",
        using: :nounzip
    sha256 "0b2a0399ad6becb2348ee92cb10b0e70830dea8e6681e8dc4cd28068ab0a7fac"
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
