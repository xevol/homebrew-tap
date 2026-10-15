class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.14.1"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.14.1/xevol-darwin-arm64.tar.gz"
      sha256 "5bc7b81c7c74d5f4c3d1ef561e256974d529d3f8ee1afcf7e748265c7197f9b6"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.14.1/xevol-darwin-x64.tar.gz"
      sha256 "1eb395939a575382ae42777e065df51012aa101ab078f57bda79e9b513dc272e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.14.1/xevol-linux-x64.tar.gz"
      sha256 "138eb0247cd5a066563ddc82170038164d8b3dbc942c17a0e3fd8fa8b661c4ec"
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
    assert_match "0.14.1", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
