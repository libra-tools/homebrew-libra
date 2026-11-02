class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.131"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.131/libra-darwin-arm64",
        using: :nounzip
    sha256 "c29de0e92605207ffd68ac3bd2a8b39280034cda9ac3d36fdd93eb8634a9e4aa"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.131/libra-linux-amd64",
        using: :nounzip
    sha256 "26406066317117012b4c65ecd7c5eb92f5983dfc8aac7fc6e5c3728495530e34"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.131/libra-linux-arm64",
        using: :nounzip
    sha256 "5b3c14fbabc6e8dcc62b702e5703424ed33c208ddba4220b73bb281e900c8d73"
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
