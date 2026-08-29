class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.12.7"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.7/xevol-darwin-arm64.tar.gz"
      sha256 "dabd7c62536b90c1d6fefaeff1bfea6680a0eb65996ea1e4838220fbfd29badd"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.7/xevol-darwin-x64.tar.gz"
      sha256 "abfe144ce62ff69eb366e7c69d51e4ed455a92456b3f101b06506cf56139fa0b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.7/xevol-linux-x64.tar.gz"
      sha256 "b410fb328dbb3bf8fb1410d36c80768c0c0e5c73b612e3b441eb76d8be086796"
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
