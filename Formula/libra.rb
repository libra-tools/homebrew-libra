class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.29"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.29/libra-darwin-arm64",
        using: :nounzip
    sha256 "009e0dadf0010dbb178dbac6ecf117195d2ad399c547c25eb6271012b83dbacb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.29/libra-linux-amd64",
        using: :nounzip
    sha256 "43525fa7386f405d2c02bcf6bb3abefbe5d97159493e4f7dc5083826c8ac85ba"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.29/libra-linux-arm64",
        using: :nounzip
    sha256 "3ef9a9313c0d97a6d91085ae15f71ea05e0f50ea64e86831d444dd415b9aa774"
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
