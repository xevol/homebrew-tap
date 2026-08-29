class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.12.7"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.7/xevol-darwin-arm64.tar.gz"
      sha256 "62df60b617ee10eb07edddd7e14a93f30d2c6ff7b61914bf87c826f32526590a"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.7/xevol-darwin-x64.tar.gz"
      sha256 "18a63a84fa854c9310174e5b080b19ead4185a89667ec3a98176bd38745a6ce4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.7/xevol-linux-x64.tar.gz"
      sha256 "8038910fc0bba425a2d1e4826420ebebc12533e7e18e0c0bf3bf48742e875d1c"
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
    assert_match "0.12.7", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
