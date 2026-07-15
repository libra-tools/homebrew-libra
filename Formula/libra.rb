class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.18.93"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.18.93/libra-darwin-arm64",
        using: :nounzip
    sha256 "df2ca2e0d58fb8603cc3af3ce629b6ea5ff5dc617ccfa3e97ede901857bca486"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.18.93/libra-linux-amd64",
        using: :nounzip
    sha256 "358f5bfa52e6b1e67c0ac0b9dee208c127795401276252d1cf60f891c80c800f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.18.93/libra-linux-arm64",
        using: :nounzip
    sha256 "ceb0a9055f66e82ad23c6b00baa1ff035435d206ed3afc46a2ef27a7e01dae48"
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
