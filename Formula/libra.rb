class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.35"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.35/libra-darwin-arm64",
        using: :nounzip
    sha256 "7f95d1f0fb1e611d53a0a040089a095bc13d4605f7a4f941e10ca336e168cd5b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.35/libra-linux-amd64",
        using: :nounzip
    sha256 "0f5b48ab9269bb367ca7423c7cab036457eca50afd8ee63842464d5652f8bf36"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.35/libra-linux-arm64",
        using: :nounzip
    sha256 "9fdaaac70235a485394086268ddc8ddb8b1b771de877e34cb4c366bfc9eee9a0"
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
