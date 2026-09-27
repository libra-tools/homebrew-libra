class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.27.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.27.1/libra-darwin-arm64",
        using: :nounzip
    sha256 "bb0c429bc5cc4929ef86fc276840571067b3f7f51a79e69bcfc723eb4adb35fc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.27.1/libra-linux-amd64",
        using: :nounzip
    sha256 "c29545334acdebd31feaaf8aae7a12e9b0dbe64416ed532d4f4e16fc87501646"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.27.1/libra-linux-arm64",
        using: :nounzip
    sha256 "12e6cd61338917359148956b20458bf38314eda279c66f03a9890f1efe0abe72"
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
