class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.4/libra-darwin-arm64",
        using: :nounzip
    sha256 "a79eb30e86a6f01c276e512fe5e0505d2ecb3f414b10468f0de32d7dd72b5ddf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.4/libra-linux-amd64",
        using: :nounzip
    sha256 "42ad3bcb2e08f4e3ffb7ba01d7d33d8cf255c0f41b14018761fcd80968a70547"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.4/libra-linux-arm64",
        using: :nounzip
    sha256 "8dcf954b0ee9f74424069cebbe841fd976315e992121fe5fb984c02d8751ca22"
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
