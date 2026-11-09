class Libra < Formula
  desc "AI agent-native version control system with Git on-disk compatibility"
  homepage "https://github.com/libra-tools/libra"
  version "0.30.163"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.163/libra-darwin-arm64",
        using: :nounzip
    sha256 "6209c5fd761da74cc0750c407745cf074b38de62092ac2ec9c920035ef1fe357"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.libra.tools/libra/releases/v0.30.163/libra-linux-amd64",
        using: :nounzip
    sha256 "7f661ab59e55c2ad7abd4603845be55f746ee2385549db9d59b76b229e7552a8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.libra.tools/libra/releases/v0.30.163/libra-linux-arm64",
        using: :nounzip
    sha256 "a5f6f599578c025137e3822b09832cbf1780342a08bb2ec0fdf55eb959dd2842"
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
