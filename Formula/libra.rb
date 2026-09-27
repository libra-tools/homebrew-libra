class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.27.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.27.2/libra-darwin-arm64",
        using: :nounzip
    sha256 "e1c7bad21cf42bd1346d4c352bb2cb88aef126507e8a1647ff8b30bcb953a5f2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.27.2/libra-linux-amd64",
        using: :nounzip
    sha256 "1a9b110b4eab94415921529c60763f4ee8b44dd957e8daf3e7d4985f2d356ab7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.27.2/libra-linux-arm64",
        using: :nounzip
    sha256 "2153fd19ffbdaa6607dcfb349477461fe1b147757181f9a2fa2c3c24cd62b469"
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
