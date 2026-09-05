class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.15"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.15/libra-darwin-arm64",
        using: :nounzip
    sha256 "e0115e2346b8acdf120997b41e4788eca23d4dd1155e717837d1a095e7fbe2b3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.15/libra-linux-amd64",
        using: :nounzip
    sha256 "9ed5b4d3c0bab4928b895a80f835d8bc321547ff00235c3ce82bbceea5970980"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.15/libra-linux-arm64",
        using: :nounzip
    sha256 "abbf0e84eb4ad4a13635a22d410f3b3bba3ae724257cd097c254de5a04ffba38"
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
