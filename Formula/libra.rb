class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.161"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.161/libra-darwin-arm64",
        using: :nounzip
    sha256 "f872584373d311088dc0d769c2b39558be0ab9b0fceb9886079e20ac9a6dc2be"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.161/libra-linux-amd64",
        using: :nounzip
    sha256 "a60ca4ca54404b30eb023d66ac3ada0421081aaab2835ac489c6cc03a4140208"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.161/libra-linux-arm64",
        using: :nounzip
    sha256 "b93f370e20cb632b9b2b6197b7685cf4a336ff7bbafb8c2efd52992db9d9b8e7"
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
