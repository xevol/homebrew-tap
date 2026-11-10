class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.21.0"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.21.0/xevol-darwin-arm64.tar.gz"
      sha256 "db66c8580421bae6f0a199c341085ed18a550285fd9e5244129b955f0e9ab632"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.21.0/xevol-darwin-x64.tar.gz"
      sha256 "cb3fea3b43b57bcbfcfe4bd83c44c6f56c17451c462865ad8a26311a086944a1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.21.0/xevol-linux-x64.tar.gz"
      sha256 "aac2d11db0db7b094a5ee7da9e318b2e3f10e050d4d2325d66284f4ccd346833"
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
    assert_match "0.21.0", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
