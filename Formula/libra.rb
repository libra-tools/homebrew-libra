class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.210"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.210/libra-darwin-arm64",
        using: :nounzip
    sha256 "a9aab7b11253a3e88be01926993097b017321e72b7a7b0ed73f0260bb1d17477"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.210/libra-linux-amd64",
        using: :nounzip
    sha256 "cefe09ac06ec4c14b3a3aad7e42bfaa3bc674ef75fb7caa98273d4eb480e619e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.210/libra-linux-arm64",
        using: :nounzip
    sha256 "324923f93814940cb8dadb5a838a123cc0c2c65bc872157f4c9c4d4db2cbfa7e"
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
