class Xevol < Formula
  desc "Command-line tool to consume, remix, make, publish, and offer systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.11.16"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/xevol-cli/releases/download/v0.11.16/xevol-darwin-arm64.tar.gz"
      sha256 "a8e237a1ed7330258cc995a9274bf71ea3280e711152af815079b798ae79283c"
    else
      url "https://github.com/xevol/xevol-cli/releases/download/v0.11.16/xevol-darwin-x64.tar.gz"
      sha256 "0a120dd4ca545f786b2d1b9f34bb3256cebbb8eedbbb30d0b8df622fe27eb7f6"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/xevol/xevol-cli/releases/download/v0.11.16/xevol-linux-x64.tar.gz"
    sha256 "df0ecc18e93e3f21de1d2ce0f873d2203d0b3590a3b9ef9f9d8c1d717e3143e8"
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
    assert_match "0.11.16", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
