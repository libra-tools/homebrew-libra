class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.44"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.44/libra-darwin-arm64",
        using: :nounzip
    sha256 "d48244fc2635e41d99940aa39dcc7b3c36fcd42aeb84d57ebe1d6d6c7fe079c1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.44/libra-linux-amd64",
        using: :nounzip
    sha256 "137c72f1387a8aa31e26216e301ab27f2d41245cab334c8ef30c78e1c9568fe2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.44/libra-linux-arm64",
        using: :nounzip
    sha256 "3ede0e2243cf0f6e45d86b56c40b16881f63bb82e6939497bf6c125143b82b04"
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
