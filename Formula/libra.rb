class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.48"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.48/libra-darwin-arm64",
        using: :nounzip
    sha256 "7336eac3cbf21e4324015615b9c2dded39c6fc18227c55310dba638af32431d8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.48/libra-linux-amd64",
        using: :nounzip
    sha256 "a812bd8f9a6e9efd53232d80ecd384b74c16a63fa4978cf8a88ef96e3da44e4b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.48/libra-linux-arm64",
        using: :nounzip
    sha256 "686785cc0a0d919aae1d943023581fdddbdc984751b6b493b8dcde571faad553"
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
