class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.20.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.20.0/libra-darwin-arm64",
        using: :nounzip
    sha256 "f46fe5919e860e6f5920a21b8ae4839619399b036fe6c884e3e2810ed757b548"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.20.0/libra-linux-amd64",
        using: :nounzip
    sha256 "5072a1ce1c251617934c7a24007392643b1687312641b4fc518ac37e95c5adde"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.20.0/libra-linux-arm64",
        using: :nounzip
    sha256 "f72ebf65408c4bcea280d673cf486d149303e2a46af46d7181019a8cd242d76c"
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
