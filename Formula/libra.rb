class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.50"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.50/libra-darwin-arm64",
        using: :nounzip
    sha256 "7778554595b48607d40e4713edd233137ac5c04fea54f3336eebea93f7e639b9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.50/libra-linux-amd64",
        using: :nounzip
    sha256 "b8b1f26b1d064c602a0a4cf46510f70914897aec31fc5ab59e0ee67ae05e9c7d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.50/libra-linux-arm64",
        using: :nounzip
    sha256 "d488a53488404256fb36579a221d39601fc886c6e5f63e446df92c5d3ba24414"
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
