class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.17.0"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.17.0/xevol-darwin-arm64.tar.gz"
      sha256 "43c8358d51df0fa415ec13f38e83bb881e317f1dfd8fac83a5c9fda8800890bd"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.17.0/xevol-darwin-x64.tar.gz"
      sha256 "768aaeaac24b0d5412465337b96747d375a37254f9440c1135daced50beca25e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.17.0/xevol-linux-x64.tar.gz"
      sha256 "8e69522b75bc881eda3fd5d8f1833ec81cfdda030da549bee316b8aca5e0b912"
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
    assert_match "0.17.0", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
