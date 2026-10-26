class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.89"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.89/libra-darwin-arm64",
        using: :nounzip
    sha256 "fa6ac5bf63bbb3a8f153c0df1df0a1d0bf98ef59088e299cb76628d632ecb460"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.89/libra-linux-amd64",
        using: :nounzip
    sha256 "25dbb0bd50a8f617aa2bf1f78f4a23fb663fbf4a8b128a3a0af79e719542109b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.89/libra-linux-arm64",
        using: :nounzip
    sha256 "fbef46ebd4aea8279ce71f7851203e7d637318baf56e1e6ee53ebafb72892baa"
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
