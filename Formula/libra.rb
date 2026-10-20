class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.71"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.71/libra-darwin-arm64",
        using: :nounzip
    sha256 "8c6255d3e160765bbcdbf4725c87c933da489008f5de12182926b641a846af57"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.71/libra-linux-amd64",
        using: :nounzip
    sha256 "753464186f89c5fe01303e2036874fd8a51e28ed862105e8d63b2fdc8c3a11b4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.71/libra-linux-arm64",
        using: :nounzip
    sha256 "5b885c95b72d2c10e11ccf743f7adc210c32435d222cbdbb40339ab962f43e98"
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
