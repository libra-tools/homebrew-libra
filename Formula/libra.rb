class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.63"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.63/libra-darwin-arm64",
        using: :nounzip
    sha256 "2871b9de9693b38453ecb36948d30150efc6a4f5af609351d655620729dc23f1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.63/libra-linux-amd64",
        using: :nounzip
    sha256 "5c2870a051a0d566df05c95172d3cf236b95c05b6fb886420b3a8a49aa15ef90"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.63/libra-linux-arm64",
        using: :nounzip
    sha256 "7793b0afb9b42214b900deb47e40845cce31357b0fea91459e54a8dfc920fbe7"
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
