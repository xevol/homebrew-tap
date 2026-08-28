class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.12.6"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/stack/releases/download/v0.12.6/xevol-darwin-arm64.tar.gz"
      sha256 "25391cea7ae738aa122c2af28298a08af0f61c653058e0b416981f1d9d768c0c"
    else
      url "https://github.com/xevol/stack/releases/download/v0.12.6/xevol-darwin-x64.tar.gz"
      sha256 "ef3fabeb3abb4bfca66aefce600c568087b1170111a22227b61dd7ccc86b44fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/stack/releases/download/v0.12.6/xevol-linux-x64.tar.gz"
      sha256 "46539afd7dc6128d36c6f5b20fd24b4bf03d56c6b933421b262ea023db349898"
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
    assert_match "0.12.6", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
