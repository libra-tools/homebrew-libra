class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.158"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.158/libra-darwin-arm64",
        using: :nounzip
    sha256 "f46141e9a96773b042125f54b9806009e22f841103d758ff23e96fa68193d4ea"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.158/libra-linux-amd64",
        using: :nounzip
    sha256 "0261b8cf2f5544fa9648eaa125ebab03e858401bc7b8bd46b4ab9a03c5b012d5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.158/libra-linux-arm64",
        using: :nounzip
    sha256 "f6c05ce9f3a158a6a9a817b6a2c051eec8e4fff1c02f83ed3dd43ba4b0f960a0"
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
