class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.10"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.10/libra-darwin-arm64",
        using: :nounzip
    sha256 "966082b05ababa09ef20c48159ae3f3ebe3272183f10438a49de3141afdaf4bc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.10/libra-linux-amd64",
        using: :nounzip
    sha256 "84f8d9c7d56e763a797bfb7042ee7fdd09ce7693ddb00bab825c84b76f5c0fad"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.10/libra-linux-arm64",
        using: :nounzip
    sha256 "ff90b56751220168298f8e26dc8982a2e243343b6415ab153d9134395741b4c2"
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
