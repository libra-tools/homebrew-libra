class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.55"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.55/libra-darwin-arm64",
        using: :nounzip
    sha256 "649dc8cad6e40b7905e650a93762c9632887af192282975cfbf274f54e2debee"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.55/libra-linux-amd64",
        using: :nounzip
    sha256 "f924b089a9eb1005e415a1d2263db0491ac8daade7f562bd5eb08387a90af72f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.55/libra-linux-arm64",
        using: :nounzip
    sha256 "47c376da797a2d2ff0abff6abeb365e8aed0880c0e5719323e8e5a106004a820"
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
