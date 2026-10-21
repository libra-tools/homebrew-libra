class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.84"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.84/libra-darwin-arm64",
        using: :nounzip
    sha256 "2b28c0492575de42ef1d7484f785e227c53f90ef69389b23036b31ed03120a86"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.84/libra-linux-amd64",
        using: :nounzip
    sha256 "7db57010f6f583df4147306448048826d77b5265843f9e9f7d9e8728e1703f5c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.84/libra-linux-arm64",
        using: :nounzip
    sha256 "823d57c772d3678a57f7415030a89e84b414e38975afadec7efc4873c903a284"
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
