class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.15.0"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.15.0/xevol-darwin-arm64.tar.gz"
      sha256 "195b742f86b1c282b5c4e11e1abc2d60057a7e3e5b9d5d1d3d21ec07b1cad570"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.15.0/xevol-darwin-x64.tar.gz"
      sha256 "807994f3ea04faee869b9427ca5a3946f699abc9cbaf048eedc364707957106d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.15.0/xevol-linux-x64.tar.gz"
      sha256 "cc2313e40f8e9f213dcfe31cc71657d6fafd81315a4fdab2ef2adfabb9477ff5"
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
    assert_match "0.15.0", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
