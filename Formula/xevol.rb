class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.12.9"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.9/xevol-darwin-arm64.tar.gz"
      sha256 "a298d0b1c46fede638a8adac8a50b7d5256acc76b5d0ea91cab529031d4e2ff5"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.9/xevol-darwin-x64.tar.gz"
      sha256 "3aaf08bf215480f9cdee94d04021b0460ae28e6fb9ee0877931f1160c6ec2673"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.9/xevol-linux-x64.tar.gz"
      sha256 "0ff59028bf5df0e7f719e9840e42881b6f3d3dda842878e02ce5ebc48975d223"
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
    assert_match "0.12.9", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
