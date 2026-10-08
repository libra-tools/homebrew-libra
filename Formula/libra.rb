class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.37"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.37/libra-darwin-arm64",
        using: :nounzip
    sha256 "d00d4c31e3f78adadd53d9a8d03bd117a6fbbac9cf3b8a3190ca1bd41167c268"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.37/libra-linux-amd64",
        using: :nounzip
    sha256 "99221aa0d3ad1ac0c34d34dd4f412a23783f224d48df1a8e89eb650250380d76"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.37/libra-linux-arm64",
        using: :nounzip
    sha256 "a60f8267e4f576070201ae4979425ae86422662cb1d9fbecaccfbcc45a43044b"
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
