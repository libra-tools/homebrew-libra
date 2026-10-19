class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.62"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.62/libra-darwin-arm64",
        using: :nounzip
    sha256 "7b41ee5a657c9aa9ac7010842799d07c7f7f39c97a7e6742db07f0e674e2fc1e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.62/libra-linux-amd64",
        using: :nounzip
    sha256 "1ed953cf3fcab804d8ab356216ee95b704d04fa2238c1ab12b57035024ed2b47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.62/libra-linux-arm64",
        using: :nounzip
    sha256 "904e23cafe0ddb6f1255aa35db0df9cc61547f58bf22ec5a7782ae650b8e7600"
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
