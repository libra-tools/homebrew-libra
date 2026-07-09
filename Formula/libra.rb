class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.18.22"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.18.22/libra-darwin-arm64",
        using: :nounzip
    sha256 "0d0e600d80829a9783395ded62871a372b1c52ab23a62f963172be4a11f6d30d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.18.22/libra-linux-amd64",
        using: :nounzip
    sha256 "a7ab2a6362d56a67349b9d5dbbfa3c805cdb04ec695ffee04dfde598c349e32c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.18.22/libra-linux-arm64",
        using: :nounzip
    sha256 "1cf99e47242823b0c870e4237a9b9878186513123162ef6bd0a49e6a36b3f624"
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
