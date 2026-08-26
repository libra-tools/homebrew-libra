class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.27"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.27/libra-darwin-arm64",
        using: :nounzip
    sha256 "f9a086d37c5162f2429194bd123d6add7b65c179c5d27ab0e6ec3bd2b1664168"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.27/libra-linux-amd64",
        using: :nounzip
    sha256 "e9ac1c54219b4bf739a0da5ff1b408aff6c1105cd7702d43aa19363adc8cd74d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.27/libra-linux-arm64",
        using: :nounzip
    sha256 "246b0210d09b4e9eba87b762273d8bb7ac76509d4007eff16a4a7623067f9434"
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
