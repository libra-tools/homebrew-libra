class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.0/libra-darwin-arm64",
        using: :nounzip
    sha256 "32b11431096e4cfd98ef5d793fb583f45b8ea615399cd86ff6637a4b59e5f8dc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.0/libra-linux-amd64",
        using: :nounzip
    sha256 "2620f30d54aaa0d2642b5e0b0111472f2209c5a3e7c83361b0d5edaa9eabe81f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.0/libra-linux-arm64",
        using: :nounzip
    sha256 "ed00dd6ae25fbdfb0a5cf097c63ba7c299c509a04428e08e7682fcc055a461ec"
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
