class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.127"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.127/libra-darwin-arm64",
        using: :nounzip
    sha256 "08e923070620de814a877bfff4d08ef4a831c97ac3dfa8eee5c802baae95c014"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.127/libra-linux-amd64",
        using: :nounzip
    sha256 "acb15ab220b8fdfdf2c95915d123e8700b1e02765ebf057b4311763ddd56dc22"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.127/libra-linux-arm64",
        using: :nounzip
    sha256 "951d9f113e6fbcc608fd242008fb353a97318f3e6ea8f1fd98942cb2ec1a4b2a"
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
