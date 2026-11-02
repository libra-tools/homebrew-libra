class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.134"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.134/libra-darwin-arm64",
        using: :nounzip
    sha256 "f2bf17a99270239b5e8dec3d2d481af8d9ddbee61dfe8a361d4da1c7b069bc0f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.134/libra-linux-amd64",
        using: :nounzip
    sha256 "6885c84f74cf2ba7426893efc8793ca80992affa3e1255aeb4ee821e54c1ae67"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.134/libra-linux-arm64",
        using: :nounzip
    sha256 "9175f40e283a7189e7713d3029abf1ce42567fd3d066b6913c05b10f992ebec5"
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
