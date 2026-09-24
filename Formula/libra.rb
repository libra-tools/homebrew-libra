class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.59"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.59/libra-darwin-arm64",
        using: :nounzip
    sha256 "4b4feb8a58bcbd1133e67fcef7bf2164bdc698bfaac1f3635e0ce0b52eba20a2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.59/libra-linux-amd64",
        using: :nounzip
    sha256 "009633882381426947b1a2cf02faa5ce9b0df3ca9f3b9fa4faf38dca7896111e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.59/libra-linux-arm64",
        using: :nounzip
    sha256 "4e28c2e7ae5771ba9c2fb7d394b6b22c1ffe5514a7298a7d1ca1d8f9109687b6"
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
