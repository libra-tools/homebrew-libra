class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.171"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.171/libra-darwin-arm64",
        using: :nounzip
    sha256 "4575409e503224520a456bbc95ab23e6bc109f7b679939493f375a5e33af9796"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.171/libra-linux-amd64",
        using: :nounzip
    sha256 "16a082453158d99755038655ea2d2b3ad770d65d08c1ae8a9d5cf31327744b00"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.171/libra-linux-arm64",
        using: :nounzip
    sha256 "ef4041554979416c3ddd46ca6fc33360cd10467394b8afec331f1cea4d496368"
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
