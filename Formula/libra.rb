class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.29"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.29/libra-darwin-arm64",
        using: :nounzip
    sha256 "ed3bd16c196aec9b2b07cb17d6fb19eaf0bbd8900bd30f2066509445a44c4e8f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.29/libra-linux-amd64",
        using: :nounzip
    sha256 "adc174a2d30bf685b781bd5b839237dc68b71d656a2e5426606c40954c8fb407"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.29/libra-linux-arm64",
        using: :nounzip
    sha256 "307f7b73c6cb96212089cf74c27734bd9755b0e63ef6da00772dbb156cb2d163"
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
