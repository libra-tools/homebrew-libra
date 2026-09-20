class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.32"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.32/libra-darwin-arm64",
        using: :nounzip
    sha256 "254787a580b95b677573ab07b0a524c3a61c8c0f902b658b6a9227eac704c4b0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.32/libra-linux-amd64",
        using: :nounzip
    sha256 "829b12351bf1a0876a301e001293bd178d6d36e1eca2ebb3fa61d5a66adfe760"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.32/libra-linux-arm64",
        using: :nounzip
    sha256 "d156cd037dd3ae7cb9a42378aa65a4150f05c67adac5edeb7b11bcbf7b7f9183"
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
