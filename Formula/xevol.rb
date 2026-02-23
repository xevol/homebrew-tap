class Xevol < Formula
  desc "Command-line tool to consume, remix, make, publish, and offer systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.11.22"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/xevol-cli/releases/download/v0.11.22/xevol-darwin-arm64.tar.gz"
      sha256 "4cc1b8ca4c47b3456d2a5eb533e0f3095131e1bc7060d60eb58991325bc1c590"
    else
      url "https://github.com/xevol/xevol-cli/releases/download/v0.11.22/xevol-darwin-x64.tar.gz"
      sha256 "e42f04edc779d9ebf3d7ad851c9f7ec6772913de2d1b0efe62a3c6998a3153c2"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/xevol/xevol-cli/releases/download/v0.11.22/xevol-linux-x64.tar.gz"
    sha256 "539375aaecaf85e27a6050d79148939648a434028634f360c1e4b13d94f44e08"
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
    assert_match "0.11.22", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
