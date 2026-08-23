class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.21.17"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.17/libra-darwin-arm64",
        using: :nounzip
    sha256 "6a8ad4b6f7fffc74cbc8179edd7c613df49852c0a88ffc2e9617d8dd5f6a3fc1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.21.17/libra-linux-amd64",
        using: :nounzip
    sha256 "7fb68663e196ef83f77c5d45c2f42f2114c7342ceb1989dcc75a2c0358d73c39"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.21.17/libra-linux-arm64",
        using: :nounzip
    sha256 "07eeaf0f4b4f3e294efdf5b0181a26d03b943b92b55682ea7a7692da6ae7a409"
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
