class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.18.0"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.18.0/xevol-darwin-arm64.tar.gz"
      sha256 "3b29304a5436096125e00c905de2ffbe61562ed6fb3b333f9f096073243fd38e"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.18.0/xevol-darwin-x64.tar.gz"
      sha256 "e7f3583497c1ba9612fac167047e5e4bad0c28d3385c335feb7abdddeb506c5d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.18.0/xevol-linux-x64.tar.gz"
      sha256 "88a8de8d7423e56bf0036e77e54bff2758b2016dcb88bea199863d9f3dac90de"
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
    assert_match "0.18.0", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
