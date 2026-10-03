class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.26"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.26/libra-darwin-arm64",
        using: :nounzip
    sha256 "b492d9f769f7a273d16ba00b66f252165b6a0af4328f31aac981c1f7be10b780"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.26/libra-linux-amd64",
        using: :nounzip
    sha256 "8f64ce320e570b24049f13452e39c87bf9af3c406234098eb184800f5772b584"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.26/libra-linux-arm64",
        using: :nounzip
    sha256 "19efdbc6ebac90f9638f9772aa3794d76b03923eac0ec1109fd205922c62a2b1"
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
