class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.42"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.42/libra-darwin-arm64",
        using: :nounzip
    sha256 "5a440a9dab7da87a5b33a1de070346b4af642e8c0d8f355bf03c86c9b2b3c426"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.42/libra-linux-amd64",
        using: :nounzip
    sha256 "77e8ff0b9c70c9a167b8795479b5b5725d9b12f3862b50948c34a1b7bc70025e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.42/libra-linux-arm64",
        using: :nounzip
    sha256 "1c7d86897288b8771f4856abeeef1925377f81dc673919fe7a0323f91ff7d88d"
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
