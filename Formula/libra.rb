class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.120"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.120/libra-darwin-arm64",
        using: :nounzip
    sha256 "0496a7573f57a305e989f682313aecc725e6704c3242e932e6657ceed87faf2f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.120/libra-linux-amd64",
        using: :nounzip
    sha256 "c9a0477f40f9d7e16832bfad9cdf684c2c18bd85ec03fcc92c589c0964af0296"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.120/libra-linux-arm64",
        using: :nounzip
    sha256 "e373cd78f13eb0333fe6dc2453b7691151ae499b475ceea7da26ce6da9f221e0"
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
