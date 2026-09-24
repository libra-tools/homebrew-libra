class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.64"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.64/libra-darwin-arm64",
        using: :nounzip
    sha256 "e2947351f80ef23095f03d680bfb8d7530c19ca0de61834b46edf2bc556e99e7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.64/libra-linux-amd64",
        using: :nounzip
    sha256 "1d8377dbb13ab333f60a4c3a1eabd6c10d71efffd88aa50c8caf0c6aab3e51c8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.64/libra-linux-arm64",
        using: :nounzip
    sha256 "ece94170c5441485d110f00fbffb990a212335afdaa98dbcc42e46d6df756884"
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
