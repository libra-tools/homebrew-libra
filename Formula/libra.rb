class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.18.60"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.18.60/libra-darwin-arm64",
        using: :nounzip
    sha256 "a1930319d14e59b3925889d5d8afc71971b996b5418b252c7110116d4aa81921"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.18.60/libra-linux-amd64",
        using: :nounzip
    sha256 "beb60cdf3077ad9304cdbbcc8b01bd6511f1583752946cec0feaa505b5e52f89"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.18.60/libra-linux-arm64",
        using: :nounzip
    sha256 "b66ad3ded87580e431f8640df057792f3a568bf740c9616bea05f7dd17fe4c56"
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
