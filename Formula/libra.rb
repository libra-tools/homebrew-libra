class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.167"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.167/libra-darwin-arm64",
        using: :nounzip
    sha256 "29a190200ce7e73424b94de510661a0b450f0c3153aebe40005e889cae358973"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.167/libra-linux-amd64",
        using: :nounzip
    sha256 "7053fcbf706abe2f33d5f10d5cdad33fb50dee2cf19b768876a5ca886704f5c4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.167/libra-linux-arm64",
        using: :nounzip
    sha256 "0188db22e5abf6fdaeeb1d9391cbb380870b8e35210603fbd7190b068bbc35f4"
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
