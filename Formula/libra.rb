class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.106"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.106/libra-darwin-arm64",
        using: :nounzip
    sha256 "659af438dfbf76822b5715985a279af0c3a71e7cfa5129337ea21b86d9492d71"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.106/libra-linux-amd64",
        using: :nounzip
    sha256 "e477e0534489680ad54314905bba3aa873e8ffcbadf0851ac8cdc58ee2e9f996"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.106/libra-linux-arm64",
        using: :nounzip
    sha256 "f45150c606c9adf9bbf40ee49d7250ba01307b6ee9f54c364473386cabca46da"
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
