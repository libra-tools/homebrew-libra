class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.12"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.12/libra-darwin-arm64",
        using: :nounzip
    sha256 "affa1dcadad23580e43f92a360572cd5da9059a8bdd9b2067778ab8c2d9c68e9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.12/libra-linux-amd64",
        using: :nounzip
    sha256 "c1f6fab74f0b8f4506a43a702ab718f11b75fa96581083f8b041dd3a90a911c2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.12/libra-linux-arm64",
        using: :nounzip
    sha256 "04bae303c51da8e5af71b8f416d81772894ecfb87779dda555104efe897dff7b"
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
