class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.12.8"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.8/xevol-darwin-arm64.tar.gz"
      sha256 "60d185e533144c3ab3d1fd3467b045ba92b061ab29c411c8b624f9d102d57f7f"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.8/xevol-darwin-x64.tar.gz"
      sha256 "eb2d491f2fa80fd03d815a70a0a3a356c13e556951f5acfa111a41e24ed13852"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.8/xevol-linux-x64.tar.gz"
      sha256 "20925b05fe018d5889451ada223f4ebb79fae622e7c09e1d4434d52fe831332c"
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
    assert_match "0.12.8", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
