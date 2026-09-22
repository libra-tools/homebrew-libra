class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.23.46"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.46/libra-darwin-arm64",
        using: :nounzip
    sha256 "93154a427857c9c3693d2bd83ac1231bf9ef012a36b579722d764e49f805096d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.23.46/libra-linux-amd64",
        using: :nounzip
    sha256 "db1b78b214e26b532587698608d81f948ecba928d4435d4af41b2cdebd637961"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.23.46/libra-linux-arm64",
        using: :nounzip
    sha256 "64330294b1d3df666e51299b116ee313e925d52b95116373fa190e6447c533ab"
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
