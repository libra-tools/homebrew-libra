class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.138"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.138/libra-darwin-arm64",
        using: :nounzip
    sha256 "c6773679d165de69b8dc6998a32191334924d8624c79968ce475bb556ff44ab6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.138/libra-linux-amd64",
        using: :nounzip
    sha256 "f9b4074d910185bbd2b515207ae84ac5b36f8b89b884a7b5dc32e4806af2aa2b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.138/libra-linux-arm64",
        using: :nounzip
    sha256 "63d114bc7e0ab86e665ec1630f5da7b9cc3a260125bd96330280afb301f59915"
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
