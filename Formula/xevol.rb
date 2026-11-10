class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.21.1"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.21.1/xevol-darwin-arm64.tar.gz"
      sha256 "18a4d58ad2b470a959688d98f29762e5ba4566701c819d9cd339822bfcd9d5bc"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.21.1/xevol-darwin-x64.tar.gz"
      sha256 "ea14cf310d9f252e112c9c344f0d7e9c5b388b69a8f2469d7beba19cc6ea8537"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.21.1/xevol-linux-x64.tar.gz"
      sha256 "3a9b060eaec2d75dcfddd0e55ba02f6da457b2da964022e4ddcc584c71b95999"
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
    assert_match "0.21.1", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
