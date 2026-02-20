class Xevol < Formula
  desc "Command-line tool to consume, remix, make, publish, and offer systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.11.20"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/xevol-cli/releases/download/v0.11.20/xevol-darwin-arm64.tar.gz"
      sha256 "07b8cf26d557f14f3631be8b1b497404f9124ffc191e23a4ebd81d85af88ffd4"
    else
      url "https://github.com/xevol/xevol-cli/releases/download/v0.11.20/xevol-darwin-x64.tar.gz"
      sha256 "c7c9fdcdd1ad81c95f929f71b2390e6f3289c10e8f9679313232d73a55801e14"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/xevol/xevol-cli/releases/download/v0.11.20/xevol-linux-x64.tar.gz"
    sha256 "9aa64e9a9d9ad2015afdc3ce70b41b50a7eaf5daecd7f4619e6d898c73778dfe"
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
    assert_match "0.11.20", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
