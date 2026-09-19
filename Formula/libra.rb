class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.9/libra-darwin-arm64",
        using: :nounzip
    sha256 "6ae6e5b3340cdac5dfed31f4022ffd971703a1962d5747a15c6caea27069d33f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.9/libra-linux-amd64",
        using: :nounzip
    sha256 "92a5e810360955c1704fe926a28ea1d2fc37aa5d47cec5fcef6407daa0549ac8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.9/libra-linux-arm64",
        using: :nounzip
    sha256 "10cea38509ec2114ba44338f147bec3b9c4b70379ca60ac7cd8d6de3ff842247"
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
