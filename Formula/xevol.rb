class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.13.0"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.13.0/xevol-darwin-arm64.tar.gz"
      sha256 "a3fa6361b70d3f4803a7b42c9a27c77183aa454b5b603d7293d6927d8f7671b9"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.13.0/xevol-darwin-x64.tar.gz"
      sha256 "885d07367100382c3b59e38c18da426c47cd571db14535da2cad0602398647f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.13.0/xevol-linux-x64.tar.gz"
      sha256 "117da0240ddcfffb6b81264c28ac3602f1f61877bf49fb27dbacc68134625b79"
    end
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
    bin.install_symlink "xevol" => "xvl"
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
