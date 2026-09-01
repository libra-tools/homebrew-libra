class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.7/libra-darwin-arm64",
        using: :nounzip
    sha256 "f4764f450a3f7cdc22f4ef4403b0962dd5f1a078f486864cf73547bb15ff06a2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.7/libra-linux-amd64",
        using: :nounzip
    sha256 "eabde002dc994b53b544120e0c3ca89390e8a1f46cc6532f45eb7bd600c22304"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.7/libra-linux-arm64",
        using: :nounzip
    sha256 "a3bb83d5e8affb6df84fa46792ce6d4ac772df350bd38e3b23bb59eb6b744013"
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
