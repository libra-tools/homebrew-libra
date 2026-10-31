class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.118"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.118/libra-darwin-arm64",
        using: :nounzip
    sha256 "fc47a4ef22e86bd3983f9f6c8963d3e1b882bc88578ea49d9e49bd5caf78f326"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.118/libra-linux-amd64",
        using: :nounzip
    sha256 "28e95edd9596537dedcc858ba6cd95a45c7b5baa72a3a7467c0bceb7d6b6569b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.118/libra-linux-arm64",
        using: :nounzip
    sha256 "03db130e9e76beea6b22a80829f13ae3ac68c4894e21264a6cb55e824307d699"
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
