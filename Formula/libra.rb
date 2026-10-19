class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.53"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.53/libra-darwin-arm64",
        using: :nounzip
    sha256 "124c6e6c51feabd541b4e075060dc0a98c56a31ad5f2ec3740701844e248cca0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.53/libra-linux-amd64",
        using: :nounzip
    sha256 "d9f102f1f656761c2faef38cd3fc9a5bc5b879bd03b7104a99daf63506b7d7cd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.53/libra-linux-arm64",
        using: :nounzip
    sha256 "ac559bc119047755e6858c65560feedc2678007bf5315139b085aa89da336b4d"
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
