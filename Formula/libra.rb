class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.10"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.10/libra-darwin-arm64",
        using: :nounzip
    sha256 "0ec0276180fcd8e4fc61de34fb683d301c59590d7daa144d871dedab58bd14e3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.10/libra-linux-amd64",
        using: :nounzip
    sha256 "91cfe4425ac9fb487d89b1ed3c720c5cf16e202401f43478131dfc5535e0cc9e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.10/libra-linux-arm64",
        using: :nounzip
    sha256 "54634bbf9c7730ee82220df6eddb4dbd70158ae9e6c6f8a586259a18ded76cab"
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
