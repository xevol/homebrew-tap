class Xevol < Formula
  desc "Command-line tool to consume, remix, make, publish, and offer systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.11.21"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/xevol-cli/releases/download/v0.11.21/xevol-darwin-arm64.tar.gz"
      sha256 "9244354bf8633d19e87d30017e7eac434070f6af60078caca962451ae713d709"
    else
      url "https://github.com/xevol/xevol-cli/releases/download/v0.11.21/xevol-darwin-x64.tar.gz"
      sha256 "e65f02528a72c7f10165bc8f92fb0bc43c4c2aeec64b5761fbccb53ee7f1e1a9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/xevol/xevol-cli/releases/download/v0.11.21/xevol-linux-x64.tar.gz"
    sha256 "53f13029eff97d8db835f5fe02e26981a44624e05ead40743c2d96bb63c46180"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "xevol-darwin-arm64" => "xevol"
      else
        bin.install "xevol-darwin-x64" => "xevol"
      end
    else
      bin.install "xevol-linux-x64" => "xevol"
    end
    # Create xvl symlink (alias)
    bin.install_symlink "xevol" => "xvl"
  end

  test do
    assert_match "0.11.21", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
