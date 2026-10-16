class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.51"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.51/libra-darwin-arm64",
        using: :nounzip
    sha256 "272819308c80175e98942d3452bccc508b5998ad15561cc521ebf815bb152ce7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.51/libra-linux-amd64",
        using: :nounzip
    sha256 "c6690c71382a0eaaf20e2057c9a58cf4cb840f6fce93449155a34196747631d5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.51/libra-linux-arm64",
        using: :nounzip
    sha256 "be4b085c8a931c1e7aa3911fefa26a8959b960ad63aae052f148da660a57483f"
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
