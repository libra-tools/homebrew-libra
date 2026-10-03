class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.25"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.25/libra-darwin-arm64",
        using: :nounzip
    sha256 "8bbb133337920103eb14ba7ebfa816f9bba7406b5c5a79e6fd776e665e6a3540"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.25/libra-linux-amd64",
        using: :nounzip
    sha256 "3f70efe771d7476ea70e6620aba4fc98be83bb8a5ae767f20957efb38792df13"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.25/libra-linux-arm64",
        using: :nounzip
    sha256 "be06315c347078a264a58d8057b1b3ec48ac1e564c069d86287ce92b30081e52"
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
