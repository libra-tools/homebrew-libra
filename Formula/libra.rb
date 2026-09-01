class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.22.9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.9/libra-darwin-arm64",
        using: :nounzip
    sha256 "2da3985ce7d61d6e3d137081348cce8607180aaa7431d0705ae6e344fedda10b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.22.9/libra-linux-amd64",
        using: :nounzip
    sha256 "c0fe33b06dea6536e130241f2a915164b6574abdbabed20a39b25c1b0a248c81"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.22.9/libra-linux-arm64",
        using: :nounzip
    sha256 "a24fc9fa1c2a6e81d070880dd645471ce71ee52bb55db8ea9d82abd1804279e8"
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
