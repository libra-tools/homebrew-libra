class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.66"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.66/libra-darwin-arm64",
        using: :nounzip
    sha256 "9fd74587b0171c9e4ee1b4d9cab3b3b618f78f495a5a7642258a4f64de2ec538"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.66/libra-linux-amd64",
        using: :nounzip
    sha256 "88162b3009690ea3b0b6527915a9bc11e0e77d8008dbf9e2ceabea37c4bb3d26"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.66/libra-linux-arm64",
        using: :nounzip
    sha256 "47dc3792e49df56ee85dd2de34897a77f683a59d660e2945810bef289e42b7c9"
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
