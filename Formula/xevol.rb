class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.14.0"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.14.0/xevol-darwin-arm64.tar.gz"
      sha256 "2149a298060df37006323408f4c1ae43da3029c64f8ee603438fc0668451c1f7"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.14.0/xevol-darwin-x64.tar.gz"
      sha256 "6b00914616676fc4e98f0eaa743d614a2267f91c186bc0db2952918b5e20c13d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.14.0/xevol-linux-x64.tar.gz"
      sha256 "0a0684f1b92c98b5c8e76019e95533b4310689fb982b1579e88472d92eebaf7e"
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
    assert_match "0.14.0", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
