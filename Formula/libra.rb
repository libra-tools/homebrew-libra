class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.110"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.110/libra-darwin-arm64",
        using: :nounzip
    sha256 "47e4577f5a1c6f3b273ae0bb5dc2105819efd141a69066b0998b63466436f79c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.110/libra-linux-amd64",
        using: :nounzip
    sha256 "548627d1913154b62cf7dbc3b8dbce35b9ba170b7747bc0051c888f9da3c7272"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.110/libra-linux-arm64",
        using: :nounzip
    sha256 "13905a74a7e8690d441e55fd9f6a912874329946648e37d13c79ebfebd5c80df"
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
