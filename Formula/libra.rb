class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.317"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.317/libra-darwin-arm64",
        using: :nounzip
    sha256 "2079d3ab7eddbb5b049602597435c52d794d96931020c317a6f8a64df4e93608"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.317/libra-linux-amd64",
        using: :nounzip
    sha256 "bd6da5616a4264cfeaed6da39055300dd2c50d29df88f83cceed420da6cbd50d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.317/libra-linux-arm64",
        using: :nounzip
    sha256 "1324c8efe0f9a1a24cf8275f8076f8d57b37587d2836cc190c8cbb59468070c5"
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
