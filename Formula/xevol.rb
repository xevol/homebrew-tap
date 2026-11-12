class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.22.1"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.22.1/xevol-darwin-arm64.tar.gz"
      sha256 "2ce6651a71563ba11457db58afcf32407f030f88a81dde059c2a18fd8cf266e9"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.22.1/xevol-darwin-x64.tar.gz"
      sha256 "e2089509e2f2e5e3dc11f8e10d06ac06de23a15d04ec6ee20001a4af5a8aed71"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.22.1/xevol-linux-x64.tar.gz"
      sha256 "bf72c604fc477aec2ae875c05d8c1f51e33c58f36a17dd66e2a106da6afaea40"
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
    assert_match "0.22.1", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
