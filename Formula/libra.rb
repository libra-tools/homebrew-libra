class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.162"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.162/libra-darwin-arm64",
        using: :nounzip
    sha256 "2fc2b747ff5ede679c37371881feb2bc1e808b017b403e11460318bb001507e3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.162/libra-linux-amd64",
        using: :nounzip
    sha256 "be3bb00cc9d5a3b52db27be3b09c1459ebdaa6a392f8bc1078813aa00726a57b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.162/libra-linux-arm64",
        using: :nounzip
    sha256 "512810f2a873857cdc5106d2fe0d43bcc3f5ff7b791703853febbf91b230f581"
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
