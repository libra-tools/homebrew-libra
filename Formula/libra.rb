class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.132"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.132/libra-darwin-arm64",
        using: :nounzip
    sha256 "fc470e0d1d91510418428cbcb626379162209016c574669a4a9e176e795f83ab"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.132/libra-linux-amd64",
        using: :nounzip
    sha256 "8f701f963e96591893bf77d92b2e48ad7fdd96d157ae1677093f6f34acf93829"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.132/libra-linux-arm64",
        using: :nounzip
    sha256 "09f61e7ab863cf00996c5aaa1270c4b6a605755e01ced2e3c34d14c2c843cbfa"
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
