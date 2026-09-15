class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.35"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.35/libra-darwin-arm64",
        using: :nounzip
    sha256 "34c9db7e0289ba9285d412b0fa4816786bb8e871b809211140e9426e6272be27"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.35/libra-linux-amd64",
        using: :nounzip
    sha256 "fe1120b98d5154814bca979e87fe3a8ec730594849b9e1e6a027e967ab9ebfc8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.35/libra-linux-arm64",
        using: :nounzip
    sha256 "e8abb073d14ec7eb510c12ff27818dbe51a327e3497f0dd6cd0089ab55dcef31"
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
