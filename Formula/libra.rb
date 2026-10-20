class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.68"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.68/libra-darwin-arm64",
        using: :nounzip
    sha256 "ff243ea3687e80dadf2737492df1680c826ead29a4219cbe51ef04aac149064c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.68/libra-linux-amd64",
        using: :nounzip
    sha256 "d119c4e4d2e3133211d381e4dcfc6d4a6445706bf78261157472ad2f440b3e65"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.68/libra-linux-arm64",
        using: :nounzip
    sha256 "c0206ef6993d3395811168b3bad890ea5c909cae2231ebf2d57bd38ccd5fea94"
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
